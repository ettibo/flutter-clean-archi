import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:api/models/app/tree/tree.dart';
import 'package:globo_fitness/managers/connectionManager/connection_manager.dart';

import 'package:api/strategy/fetch_strategy.dart';
import 'package:api/dependency_injection.dart';
import 'package:api/use_case/tree/tree_list.dart';

import 'package:globo_fitness/store/tree_store.dart';
import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/extensions/string_casing.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/shared/platform_text_wrapper.dart';

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
  List<Tree> _newTrees = [];

  @override
  void init() {
    if (treeStore.isTreeListEmpty()) {
      fetch();
    }
  }

  @override
  void dispose() {}

  @action
  Future<void> fetch({int startRow = 0, nbRows = 20}) async {
    _newTrees = await _useCase.fetch(
        startRow: startRow,
        nbRows: nbRows,
        fetchStrategy: await connectionStatusManager.hasInternetConnection()
            ? FetchStrategy.remote
            : FetchStrategy.local);
    treeStore.addTrees(_newTrees);
  }

  @action
  Future<void> onListRefresh() async {
    treeStore.clearTreeList();
    fetch();
  }

  // UI Methods
  Widget getTitle(BuildContext context, String? treeName) => textPlatform(
        content: treeName ??
            LocaleKeys.tree_list_screen_tree_without_name.localized(),
        context: context,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            decoration: TextDecoration.none,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      );

  Widget getSubtitle(BuildContext context, String? subtitle, int index) =>
      textPlatform(
        content:
            '${LocaleKeys.tree_list_screen_species.localized()} : ${subtitle != null ? subtitle.toTitleCase() : LocaleKeys.tree_list_screen_species_not_specified.localized()}',
        context: context,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            decoration: TextDecoration.none,
            fontSize: 14,
            fontWeight: FontWeight.normal),
      );

  // Lazy Loading Methods
  bool handleScroll(ScrollNotification notification) {
    if (notification.metrics.extentAfter < 300) {
      _checkIfCanFetchMoreTrees();
    }
    return true;
  }

  void _checkIfCanFetchMoreTrees() {
    if (!isLoadingTrees) {
      _fetchMoreTrees();
    }
  }

  void _fetchMoreTrees() {
    isLoadingTrees = true;
    fetch(startRow: treeStore.countTreeList() + 1, nbRows: 20)
        .then((_) => isLoadingTrees = false);
  }
}