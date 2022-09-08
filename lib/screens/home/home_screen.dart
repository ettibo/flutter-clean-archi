import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:universal_platform/universal_platform.dart';

import 'package:globo_fitness/screens/bmi/bmi_screen.dart';
import 'package:globo_fitness/screens/map/map_screen.dart';
import 'package:globo_fitness/screens/tree_list/tree_list_screen.dart';
import 'package:globo_fitness/screens/settings/settings_screen.dart';

import 'package:globo_fitness/models/navigation_object.dart';

import 'package:globo_fitness/shared/platform_app_bar.dart';
import 'package:globo_fitness/extensions/state_navigaton.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<NavigationObject> navigationList = [];
  List<BottomNavigationBarItem> items = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _generateNavigationList(context);
    _generateItems();
  }

  PlatformIconButton settingsIconButton() => PlatformIconButton(
        icon: Icon(PlatformIcons(context).settings),
        onPressed: () => navigateTo(const SettingsScreen()),
        cupertino: (_, __) => CupertinoIconButtonData(padding: EdgeInsets.zero),
        material: ((context, platform) =>
            MaterialIconButtonData(color: Theme.of(context).primaryColor)),
      );

  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return PlatformScaffold(
      appBar: platformAppBar(
        context: context,
        title: navigationList[_currentIndex].title,
        trailingWidgets: [settingsIconButton()],
      ),
      body: navigationList[_currentIndex].screen,
      bottomNavBar: PlatformNavBar(
        backgroundColor: Theme.of(context).backgroundColor,
        material: ((context, _) => MaterialNavBarData(
              selectedItemColor: Theme.of(context).primaryColor,
            )),
        items: items,
        itemChanged: onTap,
        currentIndex: _currentIndex,
      ),
    );
  }

  void _generateNavigationList(BuildContext context) {
    navigationList = [
      NavigationObject(
          title: LocaleKeys.title_title_tree_list_screen.localized(),
          icon: UniversalPlatform.isIOS ? CupertinoIcons.tree : Icons.park,
          screen: const TreeListScreen()),
      NavigationObject(
          title: LocaleKeys.title_map_title_screen.localized(),
          icon: UniversalPlatform.isIOS ? CupertinoIcons.map : Icons.map,
          screen: const MapScreen()),
      NavigationObject(
          title: LocaleKeys.title_bmi_title_screen.localized(),
          icon: UniversalPlatform.isIOS
              ? CupertinoIcons.heart
              : Icons.monitor_weight,
          screen: const BmiScreen()),
    ];
  }

  void _generateItems() {
    if (items.isEmpty) {
      for (var item in navigationList) {
        items.add(
            BottomNavigationBarItem(icon: Icon(item.icon), label: item.title));
      }
    }
  }
}
