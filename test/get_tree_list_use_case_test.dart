import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:data/data_source/tree/local_tree_data_source_impl.dart';
import 'package:data/data_source/tree/remote_tree_data_source_impl.dart';
import 'package:data/local_storage/local_storage.dart';
import 'package:data/local_storage/local_storage_impl.dart';
import 'package:domain/use_case/tree/get_tree_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetTreeLiseUseCase extends Mock implements GetTreeLiseUseCase {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late MockGetTreeLiseUseCase mockGetTreeLiseUseCase;

  setUp(() async {
    DependecyInjection.instance.inject<LocalStorage>(MockLocalStorage());
    DependecyInjection.instance
        .inject<RemoteTreeDataSource>(RemoteTreeDataSourceImpl());
    DependecyInjection.instance
        .inject<LocalTreeDataSource>(LocalTreeDataSourceImpl());

    mockGetTreeLiseUseCase = MockGetTreeLiseUseCase();
  });

  group('getTrees', () {
    final mockTreeList = [
      Tree(
          id: 0,
          name: 'TestName',
          address: 'TestAdress',
          address2: 'Test2',
          species: 'species',
          height: 8,
          circumference: 10)
    ];

    void arrangeMockDataSourceReturn1Tree() {
      when(() => mockGetTreeLiseUseCase.fetch())
          .thenAnswer((_) async => mockTreeList);
    }

    test('Check treeListCount', () async {
      arrangeMockDataSourceReturn1Tree();
      await mockGetTreeLiseUseCase.fetch();
      verify(() => mockGetTreeLiseUseCase.fetch()).called(1);
    });
  });
}
