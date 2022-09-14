import 'package:api/dependency_injection.dart';

import 'package:api/models/app/managers/connection_status_manager.dart';
import 'package:api/models/app/managers/remote_config.dart';

final RemoteConfigManager _remoteConfigManager =
    DependecyInjection.instance.get<RemoteConfigManager>();

Future<void> activateRemoteConfig() async {
  final ConnectionStatusManager connectionStatusManager =
      DependecyInjection.instance.get<ConnectionStatusManager>();
  if (await connectionStatusManager.hasInternetConnection()) {
    await _remoteConfigManager.initializeRemoteConfig();
    _remoteConfigManager.setDefaultParams();
    _remoteConfigManager.launchLoadingStrategy();
  }
}