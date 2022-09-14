import 'package:flutter/foundation.dart';

import 'package:api/dependency_injection.dart';
import 'package:api/models/app/managers/connection_status_manager.dart';
import 'package:api/models/app/managers/remote_config.dart';
import 'package:api/models/app/managers/crash.dart';

import 'package:globo_fitness/managers/connection_check_status_manager.dart';

import 'package:data/firebase/remote_config/firebase_remote_config.dart';
import 'package:data/firebase/crashlytics/firebase_crashlytics.dart';

Future<void> registerManagers() async {
  DependecyInjection.instance
      .inject<ConnectionStatusManager>(ConnectionCheckStatusManager());

  DependecyInjection.instance
      .inject<RemoteConfigManager>(RemoteConfigFirebase());
  if (!kIsWeb) {
    DependecyInjection.instance.inject<CrashManager>(CrashlyticsFirebase());
  }
}
