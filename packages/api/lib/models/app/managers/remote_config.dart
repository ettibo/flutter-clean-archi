abstract class RemoteConfigManager {
  void initializeRemoteConfig();
  void setDefaultParams();
  void launchLoadingStrategy();
  T? getValue<T>({required String key});
}
