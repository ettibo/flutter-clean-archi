import 'package:api/dependency_injection.dart';
import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:data/local_storage/local_storage.dart';
import 'package:data/models/local/tree/local_tree.dart'
    if (dart.library.html) 'package:data/models/local/tree/web_local_tree.dart';
import 'package:data/models/domain/tree/tree_domain.dart';
import 'package:flutter/foundation.dart';

class LocalTreeDataSourceImpl implements LocalTreeDataSource {
  final LocalStorage localStorage =
      DependecyInjection.instance.get<LocalStorage>();

  @override
  List<Tree> getTreeList() {
    List<Tree> trees = [];
    if (kIsWeb) {
      List<LocalTree> list = localStorage.getItems();
      for (var item in list) {
        trees.add(item.toDomain());
      }
    }
    return trees;
  }

  @override
  List<int> saveTreeList(List<Tree> list) {
    if (kIsWeb) {
      return [];
    }
    List<LocalTree> localList = [];
    for (var item in list) {
      localList.add(_fromTreeToLocalTree(item));
    }
    return localStorage.addOrUpdateItems(localList);
  }

  @override
  int clear() => localStorage.clear<LocalTree>();

  LocalTree _fromTreeToLocalTree(Tree tree) {
    LocalTree localTree = LocalTree();
    localTree.id = tree.id;
    localTree.name = tree.name;
    localTree.address = tree.address;
    localTree.address2 = tree.address2;
    localTree.species = tree.species;
    localTree.height = tree.height;
    localTree.circumference = tree.circumference;
    return localTree;
  }
}
