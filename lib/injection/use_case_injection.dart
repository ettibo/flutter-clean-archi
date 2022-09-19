import 'package:api/dependency_injection.dart';
import 'package:api/use_case/tree/tree_list.dart';
import 'package:api/use_case/tree/delete_local_trees.dart';

import 'package:domain/use_case/tree/get_tree_list_use_case.dart';
import 'package:domain/use_case/tree/delete_local_trees_use_case.dart';

void registerUseCases() {
  DependecyInjection.instance.inject<GetTreeList>(GetTreeListUseCase());
  DependecyInjection.instance
      .inject<DeleteLocalTrees>(DeleteLocalTreesUseCase());
}
