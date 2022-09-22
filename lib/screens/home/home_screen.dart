import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:universal_platform/universal_platform.dart';

import 'package:globo_fitness/screens/tree_list/tree_list_screen.dart';
import 'package:globo_fitness/screens/bmi/bmi_screen.dart';
import 'package:globo_fitness/screens/map/map_screen.dart';
import 'package:globo_fitness/screens/settings/settings_screen.dart';

import 'package:globo_fitness/navigation/app_router.dart';
import 'package:globo_fitness/models/navigation_object.dart';

import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BottomNavigationBarItem> _items = [];
  List<NavigationObject> _navigationList = [];

  final List<PageRouteInfo<dynamic>> _routers = const [
    TreeRouter(),
    MapRouter(),
    BMIRouter(),
    SettingsRouter()
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _generateNavigationList(context);
    _generateItems();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: _routers,
      bottomNavigationBuilder: ((context, tabsRouter) => PlatformNavBar(
            backgroundColor: Theme.of(context).backgroundColor,
            material: ((context, _) => MaterialNavBarData(
                selectedItemColor: Theme.of(context).primaryColor)),
            items: _items,
            itemChanged: tabsRouter.setActiveIndex,
            currentIndex: tabsRouter.activeIndex,
          )),
    );
  }

  void _generateNavigationList(BuildContext context) {
    _navigationList = [
      NavigationObject(
          title: LocaleKeys.title_tree_list_screen.localized(),
          icon: UniversalPlatform.isIOS ? CupertinoIcons.tree : Icons.park,
          screen: const TreeListScreen()),
      NavigationObject(
          title: LocaleKeys.title_map_screen.localized(),
          icon: UniversalPlatform.isIOS ? CupertinoIcons.map : Icons.map,
          screen: const MapScreen()),
      NavigationObject(
          title: LocaleKeys.title_bmi_screen.localized(),
          icon: UniversalPlatform.isIOS
              ? CupertinoIcons.heart
              : Icons.monitor_weight,
          screen: const BmiScreen()),
      NavigationObject(
          title: LocaleKeys.title_settings_screen.localized(),
          icon: PlatformIcons(context).settings,
          screen: const SettingsScreen()),
    ];
  }

  void _generateItems() {
    if (_items.isEmpty) {
      for (var item in _navigationList) {
        _items.add(
            BottomNavigationBarItem(icon: Icon(item.icon), label: item.title));
      }
    }
  }
}
