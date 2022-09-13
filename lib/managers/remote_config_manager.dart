import 'package:api/dependency_injection.dart';
import 'package:api/models/app/managers/remote_config.dart';
import 'package:globo_fitness/managers/connection_check_status_manager.dart';

final RemoteConfigManager _remoteConfigManager =
    DependecyInjection.instance.get<RemoteConfigManager>();

Future<void> activateRemoteConfig() async {
  ConnectionCheckStatusManager connectionCheckStatusManager =
      ConnectionCheckStatusManager();
  if (await connectionCheckStatusManager.hasInternetConnection()) {
    await _remoteConfigManager.initializeRemoteConfig();
    _remoteConfigManager.setDefaultParams();
    _remoteConfigManager.launchLoadingStrategy();
  } else {
    connectionCheckStatusManager.activateConnectionManager();
  }
}