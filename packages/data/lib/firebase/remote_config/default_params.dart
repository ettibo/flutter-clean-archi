import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<void> setRemoteConfigDefault() async =>
    FirebaseRemoteConfig.instance.setDefaults(const {
      "key_label_force_language_setting": "label_force_language_setting",
      "remote_config_string_example": "Default Title",
      "remote_config_int_example": 2,
    });
