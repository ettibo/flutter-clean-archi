import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/models/app/tree/tree.dart';

class LocalTreeWebDataSourceImpl implements LocalTreeDataSource {
  @override
  List<Tree> getTreeList({int startRow = 0, int nbRows = 20}) => [];

  @override
  List<int> saveTreeList(List<Tree> list) => [];

  @override
  int clear() => 0;
}
