import 'package:api/models/app/tree/tree.dart';

abstract class RemoteTreeDataSource {
  Future<List<Tree>> getTreeListRemote({int startRow = 0, int nbRows = 20});
}
