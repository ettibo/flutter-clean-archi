library api;

import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:api/models/app/managers/remote_config.dart';

class RemoteConfigFirebase implements RemoteConfigManager {
  final FirebaseRemoteConfig _instance = FirebaseRemoteConfig.instance;

  @override
  void initializeRemoteConfig() {}
  // =>
  //     _instance.setConfigSettings(RemoteConfigSettings(
  //       fetchTimeout: const Duration(minutes: 1),
  //       minimumFetchInterval: _getMinimumFetchInterval(),
  //     ));

  @override
  void setDefaultParams() async {
    String jsonAsset = await rootBundle
        .loadString("assets/default_values/remote_config_default_values.json");

    Map<String, dynamic> decodedJson = jsonDecode(jsonAsset);
    FirebaseRemoteConfig.instance.setDefaults(decodedJson);
  }

  @override
  void launchLoadingStrategy() =>
      _instance.fetch().then((_) => _instance.activate());
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

  // Duration _getMinimumFetchInterval() =>
  //     const Duration(seconds: kDebugMode ? 0 : 3600 * 12);
}
