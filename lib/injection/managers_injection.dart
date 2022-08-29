import 'package:api/dependency_injection.dart';
import 'package:api/models/app/managers/remote_config.dart';

import 'package:data/firebase/remote_config/firebase_remote_config.dart';

Future<void> registerManagers() async {
  DependecyInjection.instance
      .inject<RemoteConfigManager>(RemoteConfigFirebase());
}
