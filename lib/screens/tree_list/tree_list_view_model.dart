import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:api/models/app/managers/connection_status_manager.dart';
import 'package:api/models/app/tree/tree.dart';

import 'package:api/strategy/fetch_strategy.dart';
import 'package:api/dependency_injection.dart';
import 'package:api/use_case/tree/tree_list.dart';

import 'package:globo_fitness/store/tree_store.dart';
import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/extensions/string_casing.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

part 'tree_list_view_model.g.dart';

class TreeListViewModel = TreeListViewModelBase with _$TreeListViewModel;

abstract class TreeListViewModelBase with Store, ViewModel {
  final TreeStoreBase treeStore =
      DependecyInjection.instance.get<TreeStoreBase>();

  final GetTreeList _useCase = DependecyInjection.instance.get<GetTreeList>();
  final ConnectionStatusManager connectionStatusManager =
      DependecyInjection.instance.get<ConnectionStatusManager>();

  @observable
  bool isLoadingTrees = false;
  bool hasInternetConnection = false;
  List<Tree> newTrees = [];

  @override
  void init() {
   activateConnectionManager();
  }

  @override
  void dispose() {}

 @action
  Future<void> fetch({int startRow = 0, nbRows = 20}) async {
    newTrees = await _useCase.fetch(
        startRow: startRow,
        nbRows: nbRows,
        fetchStrategy:
            hasInternetConnection ? FetchStrategy.remote : FetchStrategy.local);
    treeStore.addTrees(newTrees);
  }

  @action
  Future<void> onListRefresh() async {
    treeStore.clearTreeList();
    fetch();
  }

  // UI Methods
  Text getTitle(BuildContext context, String? treeName) => Text(
        treeName ?? LocaleKeys.tree_list_screen_tree_without_name.localized(),
      );

  Text getSubtitle(BuildContext context, String? subtitle, int index) => Text(
        '${LocaleKeys.tree_list_screen_species.localized()} : ${subtitle != null ? subtitle.toTitleCase() : LocaleKeys.tree_list_screen_species_not_specified.localized()}',
      );

  // Lazy Loading Methods
  bool handleScroll(ScrollNotification notification) {
    if (notification.metrics.extentAfter < 300) {
      checkIfCanFetchMoreTrees();
    }
    return true;
  }

  void checkIfCanFetchMoreTrees() {
    if (!isLoadingTrees) {
      fetchMoreTrees();
    }
  }

  void fetchMoreTrees() {
    isLoadingTrees = true;
    fetch(startRow: treeStore.countTreeList() + 1, nbRows: 20)
        .then((_) => isLoadingTrees = false);
  }

  void connectionChanged(dynamic hasConnection) {
    hasInternetConnection = hasConnection;
    fetch();
  }

  void activateConnectionManager() {
    connectionStatusManager.activateConnectionManager();
    //Listen for connection change
    connectionStatusManager.connectionChangeStream
        .asBroadcastStream()
        .listen(connectionChanged);
  }
}