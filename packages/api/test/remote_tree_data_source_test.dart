import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteTreeDataSource extends Mock implements RemoteTreeDataSource {}

void main() {
  late MockRemoteTreeDataSource remoteTreeDataSource;
  setUp(() {
    DependecyInjection.instance
        .inject<MockRemoteTreeDataSource>(MockRemoteTreeDataSource());

    remoteTreeDataSource =
        DependecyInjection.instance.get<MockRemoteTreeDataSource>();
  });

  group('getTrees', () {
    final mockTreeList = [Tree.mock];

    void arrangeMockDataSourceReturn1Tree() {
      when(() => remoteTreeDataSource.getTreeListRemote())
          .thenAnswer((_) async => mockTreeList);
    }

    test('Check treeListCount', () async {
      arrangeMockDataSourceReturn1Tree();
      await remoteTreeDataSource.getTreeListRemote();
      verify(() => remoteTreeDataSource.getTreeListRemote()).called(1);
    });
  });
}
