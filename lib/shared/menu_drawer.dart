import 'package:flutter/material.dart';
import 'package:globo_fitness/models/menu_object.dart';
import '../screens/bmi/bmi_screen.dart';
import '../screens/tree_list/tree_list_screen.dart';

import 'package:globo_fitness/localization/app_localization_context.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(children: buildMdenuItems(context)));
  }

  List<Widget> buildMdenuItems(BuildContext context) {
    final List<MenuObject> menuTitles = [
      MenuObject(
          title: context.localized.homeTabBarTitle,
          screen: const TreeListScreen()),
      MenuObject(
          title: context.localized.bmiDrawerTitle, screen: const BmiScreen()),
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: Text(context.localized.appTitle,
            style: const TextStyle(color: Colors.white, fontSize: 28))));
    for (var item in menuTitles) {
      menuItems.add(ListTile(
          title: Text(item.title, style: const TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => item.screen));
          }));
    }
    return menuItems;
  }
}
