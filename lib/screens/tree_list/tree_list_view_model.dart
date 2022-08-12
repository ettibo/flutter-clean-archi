import 'package:api/strategy/fetch_strategy.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/localization/app_localization_context.dart';
import 'package:globo_fitness/extensions/string_casing.dart';

import 'package:globo_fitness/screens/settings/settings_screen.dart';
import 'package:globo_fitness/screens/tree_detail/tree_detail_screen.dart';

import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:api/use_case/tree/tree_list.dart';

part 'tree_list_view_model.g.dart';

class TreeListViewModel = TreeListViewModelBase with _$TreeListViewModel;

abstract class TreeListViewModelBase with Store, ViewModel {
  final GetTreeList useCase = DependecyInjection.instance.get<GetTreeList>();
  @observable
  ObservableList<Tree> trees = ObservableList();

  @observable
  bool isLoadingTrees = false;

  @override
  void init() {
    fetch();
  }

  @override
  void dispose() {}

  @action
  Future<void> fetch({int startRow = 0, nbRows = 20}) async {
    List<Tree> newTrees =
        await useCase.fetch(startRow: startRow, nbRows: nbRows);
    trees.addAll(newTrees);
  }

  @action
  Future<void> onListRefresh() async {
    trees.clear();
    fetch();
  }

  // Navigation Methods
  void goToDetailTree(BuildContext context, Tree tree) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TreeDetailScreen(tree: tree),
    ));
  }

  void goToSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SettingsScreen(),
    ));
  }

  // UI Methods
  Text getTitle(BuildContext context, String? treeName) =>
      Text(treeName ?? context.localized.treeWithoutName);

  Text getSubtitle(BuildContext context, String? subtitle, int index) => Text(
      '${context.localized.species} : ${subtitle != null ? subtitle.toTitleCase() : context.localized.speciesNotSpecified}');

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
    fetch(startRow: trees.length + 1, nbRows: 20)
        .then((_) => isLoadingTrees = false);
  }

  void printTrees() async {
    List<Tree> newTrees = await useCase.fetch(
        startRow: 0, nbRows: 20, fetchStrategy: FetchStrategy.local);
    for (var item in newTrees) {
      print('Tree: ${item.name} ID: ${item.id}');
    }
  }
}
