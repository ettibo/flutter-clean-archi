import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import 'package:globo_fitness/store/tree_store.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/localization/app_localization_context.dart';
import 'package:globo_fitness/extensions/string_casing.dart';

import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:api/use_case/tree/tree_list.dart';

part 'tree_list_view_model.g.dart';

class TreeListViewModel = TreeListViewModelBase with _$TreeListViewModel;

abstract class TreeListViewModelBase with Store, ViewModel {
  final TreeStoreBase treeStore =
      DependecyInjection.instance.get<TreeStoreBase>();

  final GetTreeList useCase = DependecyInjection.instance.get<GetTreeList>();

  @observable
  bool isLoadingTrees = false;

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
    List<Tree> newTrees =
        await useCase.fetch(startRow: startRow, nbRows: nbRows);
    treeStore.addTrees(newTrees);
  }

  @action
  Future<void> onListRefresh() async {
    treeStore.clearTreeList();
    fetch();
  }

  // UI Methods
  Text getTitle(BuildContext context, String? treeName) => Text(
        treeName ?? context.localized.treeWithoutName,
      );

  Text getSubtitle(BuildContext context, String? subtitle, int index) => Text(
        '${context.localized.species} : ${subtitle != null ? subtitle.toTitleCase() : context.localized.speciesNotSpecified}',
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
}
