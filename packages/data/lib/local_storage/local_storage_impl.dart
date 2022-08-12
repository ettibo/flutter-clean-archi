import 'package:api/objectbox.g.dart';
import 'package:api/models/local/base_local_object.dart';
import 'package:flutter/material.dart';

import 'local_storage.dart';

class LocalStorageImpl implements LocalStorage {
  late final Store store;

  LocalStorageImpl._create(this.store);

  static Future<LocalStorageImpl> create() async {
    WidgetsFlutterBinding.ensureInitialized();
    final store = await openStore();
    return LocalStorageImpl._create(store);
  }

  @override
  int addOrUpdateItem<T>(T item) {
    final box = store.box<T>();
    return box.put(item);
  }

  @override
  List<int> addOrUpdateItems<T>(List<T> items) {
    final box = store.box<T>();
    return box.putMany(items);
  }

  @override
  void removeItem<T>(T item) {
    final box = store.box<T>();
    if (item is BaseLocalObject) {
      box.remove(item.getId());
    }
  }

  @override
  void removeItems<T>(List<T> items) {
    final box = store.box<T>();
    List<int> ids = [];
    for (var item in items) {
      if (item is BaseLocalObject) {
        ids.add(item.getId());
      }
    }
    box.removeMany(ids);
  }

  @override
  T? getItem<T>(int id) {
    final box = store.box<T>();
    return box.get(id);
  }

  @override
  List<T> getItems<T>() {
    final box = store.box<T>();
    return box.getAll();
  }

  @override
  int clear<T>() {
    final box = store.box<T>();
    return box.removeAll();
  }
}
