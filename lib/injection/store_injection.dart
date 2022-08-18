import 'package:api/dependency_injection.dart';
import 'package:globo_fitness/store/tree_store.dart';

void registerStores() {
  DependecyInjection.instance.inject<TreeStoreBase>(TreeStore());
}
