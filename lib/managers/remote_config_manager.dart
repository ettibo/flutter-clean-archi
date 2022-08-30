import 'package:api/dependency_injection.dart';
import 'package:api/models/app/managers/remote_config.dart';

final RemoteConfigManager _remoteConfigManager =
    DependecyInjection.instance.get<RemoteConfigManager>();

void activateRemoteConfig() {
  _remoteConfigManager.initializeRemoteConfig();
  _remoteConfigManager.setDefaultParams();
  _remoteConfigManager.launchLoadingStrategy();
}
