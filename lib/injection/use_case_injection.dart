import 'package:api/dependency_injection.dart';
import 'package:api/use_case/tree/tree_list.dart';
import 'package:domain/use_case/tree/get_tree_list_use_case.dart';

void registerUseCases() {
  DependecyInjection.instance.inject<GetTreeList>(GetTreeListUseCase());
}
