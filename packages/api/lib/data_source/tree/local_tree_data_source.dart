import 'package:api/models/app/tree/tree.dart';

abstract class LocalTreeDataSource {
  List<Tree> getTreeList({int startRow = 0, int nbRows = 20});
  List<int> saveTreeList(List<Tree> list);
  int clear();
}
