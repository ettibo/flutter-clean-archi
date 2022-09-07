import 'package:data/local_storage/local_storage.dart';

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl._create();

  static Future<LocalStorageImpl> create() async => LocalStorageImpl._create();

  @override
  int addOrUpdateItem<T>(T item) => 0;

  @override
  List<int> addOrUpdateItems<T>(List<T> items) => [];

  @override
  int clear<T>() => 0;

  @override
  T? getItem<T>(int id) => null;

  @override
  List<T> getItems<T>() => [];

  @override
  void removeItem<T>(T item) {}

  @override
  void removeItems<T>(List<T> items) {}
}
