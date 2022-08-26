import 'dart:convert';
import 'dart:io';

import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:data/models/domain/tree/tree_domain.dart';
import 'package:data/models/remote/tree/tree_list_response.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteTreeDataSource implements RemoteTreeDataSource {
  @override
  Future<List<Tree>> getTreeListRemote(
      {int startRow = 0, int nbRows = 20}) async {
    Map<String, dynamic> data = await _loadDummyData();
    TreeListResponse result = TreeListResponse.fromJson(data);
    return result.toDomain();
  }

  Future<Map<String, dynamic>> _loadDummyData() async {
    final file = File('test/datasets/one_tree_list.json');
    final json = jsonDecode(await file.readAsString());
    return json;
  }
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
