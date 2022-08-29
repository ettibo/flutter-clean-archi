import 'package:api/dependency_injection.dart';
import 'package:api/models/app/managers/remote_config_manager.dart';

final RemoteConfigManager remoteConfigManager =
    DependecyInjection.instance.get<RemoteConfigManager>();

Future<void> activateRemoteConfig() async {
  await remoteConfigManager.initializeRemoteConfig();
  await remoteConfigManager.setDefaultParams();
  await remoteConfigManager.launchLoadingStrategy();
}
