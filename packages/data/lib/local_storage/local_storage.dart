import 'package:objectbox/internal.dart';

abstract class LocalStorage {
  int addOrUpdateItem<T>(T item);
  List<int> addOrUpdateItems<T>(List<T> items);
  void removeItem<T>(T item);
  void removeItems<T>(List<T> items);
  T? getItem<T>(int id);
  List<T> getItems<T, U>(
      {int startRow = 0,
      int nbRows = 20,
      QueryProperty<T, U>? orderProperty,
      int orderFlags = 0});
  int clear<T>();
}
