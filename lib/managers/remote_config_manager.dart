import 'package:api/dependency_injection.dart';
import 'package:api/models/app/managers/remote_config.dart';

final RemoteConfigManager remoteConfigManager =
    DependecyInjection.instance.get<RemoteConfigManager>();

void activateRemoteConfig() {
  remoteConfigManager.initializeRemoteConfig();
  remoteConfigManager.setDefaultParams();
  remoteConfigManager.launchLoadingStrategy();
}
