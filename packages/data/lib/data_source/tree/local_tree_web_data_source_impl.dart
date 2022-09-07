import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/models/app/tree/tree.dart';

class LocalTreeWebDataSourceImpl implements LocalTreeDataSource {
  @override
  int clear() {
    return 0;
  }

  @override
  List<Tree> getTreeList() => [];

  @override
  List<int> saveTreeList(List<Tree> list) => [];
}
