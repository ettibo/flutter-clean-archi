abstract class LocalStorage {
  int addOrUpdateItem<T>(T item);
  List<int> addOrUpdateItems<T>(List<T> items);
  void removeItem<T>(T item);
  void removeItems<T>(List<T> items);
  T? getItem<T>(int id);
  List<T> getItems<T>();
}
