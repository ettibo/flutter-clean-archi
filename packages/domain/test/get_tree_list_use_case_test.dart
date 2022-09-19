import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:domain/use_case/tree/get_tree_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteTreeDataSource implements RemoteTreeDataSource {
  @override
  Future<List<Tree>> getTreeListRemote(
          {int startRow = 0, int nbRows = 20}) async =>
      [Tree.mock];
}

class MockLocalTreeDataSource implements LocalTreeDataSource {
  @override
  List<Tree> getTreeList({int startRow = 0, int nbRows = 20}) => [Tree.mock];

  @override
  int clear() => 0;

  @override
  List<int> saveTreeList(List<Tree> list) => [0];
}

void main() {
  late GetTreeListUseCase mockGetTreeLiseUseCase;
  late List<Tree> listTree;

  setUpAll(() async {
    DependecyInjection.instance
        .inject<RemoteTreeDataSource>(MockRemoteTreeDataSource());
    DependecyInjection.instance
        .inject<LocalTreeDataSource>(MockLocalTreeDataSource());

    mockGetTreeLiseUseCase = GetTreeListUseCase();
    listTree = [];
  });

  group('getTrees', () {
    test('Check if List is empty at starting', () {
      expect(listTree.length, 0);
    });

    test('Check if ListTree is successfully completed', () async {
      listTree.addAll(await mockGetTreeLiseUseCase.fetch());
      expect(listTree.length, 1);
    });
  });
}
