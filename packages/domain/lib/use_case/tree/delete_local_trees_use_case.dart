import 'package:api/dependency_injection.dart';

import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/strategy/fetch_strategy.dart';

import 'package:api/use_case/tree/delete_local_trees.dart';

class DeleteLocalTreesUseCase implements DeleteLocalTrees {
  LocalTreeDataSource localTreeDataSource =
      DependecyInjection.instance.get<LocalTreeDataSource>();

  @override
  Future<void> deleteTrees({required FetchStrategy fetchStrategy}) async {
    if (fetchStrategy == FetchStrategy.remote) {
      localTreeDataSource.clear();
    }
  }
}
