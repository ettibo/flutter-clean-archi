import 'package:api/dependency_injection.dart';
import 'package:globo_fitness/screens/tree_list/tree_list_view_model.dart';
import 'package:globo_fitness/screens/settings/settings_view_model.dart';

void registerViewModels() {
  DependecyInjection.instance
      .inject<TreeListViewModelBase>(TreeListViewModel());

  DependecyInjection.instance
      .inject<SettingsViewModelBase>(SettingsViewModel());
}
