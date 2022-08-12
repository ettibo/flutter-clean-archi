import 'package:api/models/app/tree/tree.dart';

abstract class LocalTreeDataSource {
  List<Tree> getTreeList();
  List<int> saveTreeList(List<Tree> list);
}
