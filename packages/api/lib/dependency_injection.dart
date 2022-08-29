import 'package:get_it/get_it.dart';

class DependecyInjection {
  static final DependecyInjection instance = DependecyInjection._internal();

  void inject<T extends Object>(T item) =>
      GetIt.instance.registerSingleton<T>(item);

  T get<T extends Object>() => GetIt.instance.get<T>();

  DependecyInjection._internal();
}
