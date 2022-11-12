import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/managers/connectionManager/connection_manager_impl.dart';
import 'package:globo_fitness/managers/connectionManager/connection_manager.dart';

Future<void> registerManagers() async {
  DependecyInjection.instance
      .inject<ConnectionManager>(ConnectionManagerImpl());
}
