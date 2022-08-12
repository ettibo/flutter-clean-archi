import 'package:api/dependency_injection.dart';
import 'package:data/local_storage/local_storage.dart';
import 'package:data/local_storage/local_storage_impl.dart';

Future<void> registerStorage() async {
  final LocalStorage localStorage = await LocalStorageImpl.create();
  DependecyInjection.instance.inject<LocalStorage>(localStorage);
}
