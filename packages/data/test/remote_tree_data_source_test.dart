import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteTreeDataSource implements RemoteTreeDataSource {
  @override
  Future<List<Tree>> getTreeListRemote(
          {int startRow = 0, int nbRows = 20}) async =>
      [Tree.mock];
}

void main() {
  late RemoteTreeDataSource remoteTreeDataSource;

  setUpAll(() {
    remoteTreeDataSource = MockRemoteTreeDataSource();
  });

  group('getTrees', () {
    test('Check treeListCount', () async {
      final treeList = await remoteTreeDataSource.getTreeListRemote();
      expect(treeList.length, 1);
    });
  });
}
