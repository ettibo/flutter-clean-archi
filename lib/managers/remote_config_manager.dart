import 'package:api/dependency_injection.dart';

import 'package:api/models/app/managers/remote_config.dart';

import 'package:globo_fitness/managers/connectionManager/connection_manager.dart';


final ConnectionManager _connectionManager =
    DependecyInjection.instance.get<ConnectionManager>();

final RemoteConfigManager _remoteConfigManager =
    DependecyInjection.instance.get<RemoteConfigManager>();

Future<void> activateRemoteConfig() async {
  if (await _connectionManager.hasInternetConnection()) {
    await _remoteConfigManager.initializeRemoteConfig();
    _remoteConfigManager.setDefaultParams();
    _remoteConfigManager.launchLoadingStrategy();
  }
}