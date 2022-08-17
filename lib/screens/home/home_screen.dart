import 'package:flutter/material.dart';

import 'package:globo_fitness/screens/bmi/bmi_screen.dart';
import 'package:globo_fitness/screens/tree_list/tree_list_screen.dart';
import 'package:globo_fitness/screens/settings/settings_screen.dart';

import 'package:globo_fitness/models/navigation_object.dart';

import 'package:globo_fitness/shared/material_app_bar.dart';

import 'package:globo_fitness/localization/app_localization_context.dart';
import 'package:globo_fitness/extensions/state_navigaton.dart';

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

  IconButton settingsIcon() => IconButton(
      onPressed: () => navigateTo(const SettingsScreen()),
      icon: const Icon(Icons.settings));

  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      appBar: materialAppBar(
          title: navigationList[_currentIndex].title,
          trailingWidgets: [settingsIcon()]),
      body: navigationList[_currentIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: onTap,
        currentIndex: _currentIndex,
      ),
    );
  }

  void _generateNavigationList(BuildContext context) {
    navigationList = [
      NavigationObject(
          title: context.localized.homeTabBarTitle,
          icon: Icons.home,
          screen: const TreeListScreen()),
      NavigationObject(
          title: context.localized.bmiTabBarTitle,
          icon: Icons.monitor_weight,
          screen: const BmiScreen())
    ];
  }

  void _generateItems() {
    for (var item in navigationList) {
      items.add(
          BottomNavigationBarItem(icon: Icon(item.icon), label: item.title));
    }
  }
}
