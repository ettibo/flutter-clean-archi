abstract class RemoteConfigManager {
  Future<void> initializeRemoteConfig();
  Future<void> setDefaultParams();
  Future<void> launchLoadingStrategy();
  T? getValue<T>({required String key});
}
