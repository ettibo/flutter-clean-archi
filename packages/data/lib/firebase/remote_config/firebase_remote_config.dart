library api;

import 'package:flutter/foundation.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:api/models/app/managers/remote_config_manager.dart';

import 'package:data/firebase/remote_config/default_params.dart';

class RemoteConfigFirebase implements RemoteConfigManager {
  final FirebaseRemoteConfig _instance = FirebaseRemoteConfig.instance;

  @override
  Future<void> initializeRemoteConfig() async =>
      await _instance.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: _getMinimumFetchInterval(),
      ));

  @override
  Future<void> setDefaultParams() async => await setRemoteConfigDefault();

  @override
  Future<void> launchLoadingStrategy() async =>
      await _instance.fetch().then((_) => _instance.activate());
  // Load new values for next startup

  @override
  T? getValue<T>({required String key}) {
    switch (T) {
      case int:
        return _instance.getInt(key) as T;
      case String:
        return _instance.getString(key) as T;
      case bool:
        return _instance.getBool(key) as T;
      case double:
        return _instance.getDouble(key) as T;
      default:
        return null;
    }
  }

  Duration _getMinimumFetchInterval() => kDebugMode
      ? const Duration(seconds: 0)
      : const Duration(seconds: 3600 * 12);
}
