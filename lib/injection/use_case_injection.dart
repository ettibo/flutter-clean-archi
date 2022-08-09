import 'package:api/dependency_injection.dart';
import 'package:api/use_case/tree/tree_list.dart';
import 'package:domain/use_case/tree/tree_list.dart';

void registerUseCases() {
  DependecyInjection.instance.inject<GetTreeList>(GetTreeLiseUseCase());
}
