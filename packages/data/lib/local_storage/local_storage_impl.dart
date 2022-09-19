import 'package:flutter/material.dart';

import 'package:data/models/local/object_box/objectbox.g.dart';
import 'package:data/models/local/base_local/base_local_object.dart';
import 'package:objectbox/internal.dart';

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
  List<T> getItems<T, U>(
      {int startRow = 0,
      int nbRows = 20,
      QueryProperty<T, U>? orderProperty,
      int orderFlags = 0}) {
    final box = store.box<T>();

    Query<T> query = orderProperty != null
        ? (box.query()..order(orderProperty, flags: orderFlags)).build()
        : box.query().build();

    query.offset = startRow;
    query.limit = nbRows;

    return query.find();
  }

  @override
  int clear<T>() {
    final box = store.box<T>();
    return box.removeAll();
  }
}
