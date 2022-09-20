import 'package:globo_fitness/managers/connectionManager/connection_manager.dart';

import 'package:api/dependency_injection.dart';

ConnectionStatusManager _connectionStatusManager =
    DependecyInjection.instance.get<ConnectionStatusManager>();

void activateConnectionManager() {
  _connectionStatusManager.activateConnectionManager();
}
