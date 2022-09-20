import 'package:globo_fitness/managers/connectionManager/connection_manager.dart';

import 'package:api/dependency_injection.dart';

ConnectionManager _connectionManager =
    DependecyInjection.instance.get<ConnectionManager>();

void activateConnectionManager() {
  _connectionManager.activateConnectionManager();
}
