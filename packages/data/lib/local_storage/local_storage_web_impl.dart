import 'package:data/local_storage/local_storage.dart';

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl._create();

  static Future<LocalStorageImpl> create() async {
    return LocalStorageImpl._create();
  }

  @override
  int addOrUpdateItem<T>(T item) {
    return 0;
  }

  @override
  List<int> addOrUpdateItems<T>(List<T> items) {
    return [];
  }

  @override
  int clear<T>() {
    return 0;
  }

  @override
  T? getItem<T>(int id) {
    return null;
  }

  @override
  List<T> getItems<T>() {
    return [];
  }

  @override
  void removeItem<T>(T item) {}

  @override
  void removeItems<T>(List<T> items) {}
}
