import 'package:flutter/material.dart';
import 'injection/app_injection.dart';
import 'package:globo_fitness/models/navigation_object.dart';
import 'package:globo_fitness/screens/bmi/bmi_screen.dart';
import 'package:globo_fitness/screens/tree_list/tree_list_screen.dart';

void main() {
  setupInjectionDependencies();
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  static final List<NavigationObject> navigationList = [
    NavigationObject(
        title: 'Home',
        route: '/',
        icon: Icons.home,
        screen: const TreeListScreen()),
    NavigationObject(
        title: 'BMI',
        route: '/bmi',
        icon: Icons.monitor_weight,
        screen: const BmiScreen())
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        routes: _generateNavigation(context),
        initialRoute: '/');
  }

  Map<String, WidgetBuilder> _generateNavigation(BuildContext context) {
    Map<String, WidgetBuilder> map = <String, WidgetBuilder>{};
    for (var item in navigationList) {
      map[item.route] = ((context) => item.screen);
    }
    return map;
  }
}
