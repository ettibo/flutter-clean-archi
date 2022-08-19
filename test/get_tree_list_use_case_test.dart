import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:data/data_source/tree/local_tree_data_source_impl.dart';
import 'package:data/data_source/tree/remote_tree_data_source_impl.dart';
import 'package:data/local_storage/local_storage.dart';
import 'package:domain/use_case/tree/get_tree_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetTreeLiseUseCase extends Mock implements GetTreeLiseUseCase {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late MockGetTreeLiseUseCase mockGetTreeLiseUseCase;
  List<Tree> listTree = [];

  setUpAll(() async {
    DependecyInjection.instance.inject<LocalStorage>(MockLocalStorage());
    DependecyInjection.instance
        .inject<RemoteTreeDataSource>(RemoteTreeDataSourceImpl());
    DependecyInjection.instance
        .inject<LocalTreeDataSource>(LocalTreeDataSourceImpl());

    mockGetTreeLiseUseCase = MockGetTreeLiseUseCase();
  });

  group('getTrees', () {
    final mockTreeList = [Tree.mock];

    void arrangeMockDataSourceReturn1Tree() {
      when(() => mockGetTreeLiseUseCase.fetch())
          .thenAnswer((_) async => mockTreeList);
    }

    test('Check if List is empty at starting', () {
      expect(listTree.length, 0);
    });

    test('Check treeListCount', () async {
      arrangeMockDataSourceReturn1Tree();
      listTree = await mockGetTreeLiseUseCase.fetch();
      verify(() => mockGetTreeLiseUseCase.fetch()).called(1);
    });

    test('Check if ListTree is successfully completed', () {
      expect(listTree.length, 1);
    });
  });
}
