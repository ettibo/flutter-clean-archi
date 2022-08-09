import 'package:api/models/app/tree/tree.dart';

abstract class GetTreeList {
  Future<List<Tree>> fetch({int startRow = 0, int nbRows = 20});
}
