import 'package:api/dependency_injection.dart';
import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:api/models/domain/tree/tree_domain.dart';
import 'package:api/models/local/tree/local_tree.dart';
import 'package:data/local_storage/local_storage.dart';

class LocalTreeDataSourceImpl implements LocalTreeDataSource {
  final LocalStorage localStorage =
      DependecyInjection.instance.get<LocalStorage>();

  @override
  List<Tree> getTreeList() {
    List<Tree> trees = [];
    List<LocalTree> list = localStorage.getItems();
    for (var item in list) {
      trees.add(item.toDomain());
    }
    return trees;
  }

  @override
  List<int> saveTreeList(List<Tree> list) {
    List<LocalTree> localList = [];
    for (var item in list) {
      localList.add(_fromTreeToLocalTree(item));
    }
    return localStorage.addOrUpdateItems(localList);
  }

  LocalTree _fromTreeToLocalTree(Tree tree) {
    LocalTree localTree = LocalTree();
    localTree.readlId = tree.id;
    localTree.name = tree.name;
    localTree.address = tree.address;
    localTree.address2 = tree.address2;
    localTree.species = tree.species;
    localTree.height = tree.height;
    localTree.circumference = tree.circumference;
    return localTree;
  }
}
