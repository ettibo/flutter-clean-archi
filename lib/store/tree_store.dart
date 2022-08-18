import 'package:mobx/mobx.dart';

import 'package:api/models/app/tree/tree.dart';

part 'tree_store.g.dart';

class TreeStore = TreeStoreBase with _$TreeStore;

abstract class TreeStoreBase with Store {
  @observable
  ObservableList<Tree> trees = ObservableList();

  void addTrees(List<Tree> newTrees) {
    trees.addAll(newTrees);
  }

  void clearList() => trees.clear();

  void setTreeList(List<Tree> newTrees) {
    clearList();
    addTrees(newTrees);
  }

  bool isListEmpty() => trees.isEmpty;

  int countTrees() => trees.length;
}
