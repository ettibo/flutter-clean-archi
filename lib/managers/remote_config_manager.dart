import 'package:api/dependency_injection.dart';

import 'package:api/models/app/managers/remote_config.dart';

import 'package:globo_fitness/managers/connection_status_manager.dart';

final ConnectionStatusManager _connectionStatusManager =
    DependecyInjection.instance.get<ConnectionStatusManager>();

final RemoteConfigManager _remoteConfigManager =
    DependecyInjection.instance.get<RemoteConfigManager>();

Future<void> activateRemoteConfig() async {
  if (await _connectionStatusManager.hasInternetConnection()) {
    await _remoteConfigManager.initializeRemoteConfig();
    _remoteConfigManager.setDefaultParams();
    _remoteConfigManager.launchLoadingStrategy();
  }
}