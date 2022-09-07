extension ReplaceDotInRemoteConfigString on String {
  String replaceDotInRemoteConfig() {
    String stringWithoutDot = replaceAll('remote_config_', 'remote_config.');
    return stringWithoutDot;
  }
}
