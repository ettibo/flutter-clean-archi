// import 'package:api/dependency_injection.dart';
// import 'package:data/local_storage/local_storage.dart';
// import 'package:data/local_storage/local_storage_impl.dart';
import 'package:flutter/foundation.dart';

Future<void> registerStorage() async {
  if (!kIsWeb) {
    // final LocalStorage localStorage = await LocalStorageImpl.create();
    // DependecyInjection.instance.inject<LocalStorage>(localStorage);
  }
}
