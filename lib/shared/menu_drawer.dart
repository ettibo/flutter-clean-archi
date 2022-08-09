import 'package:flutter/material.dart';
import 'package:globo_fitness/models/menu_object.dart';
import '../screens/bmi/bmi_screen.dart';
import '../screens/tree_list/tree_list_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(children: buildMdenuItems(context)));
  }

  List<Widget> buildMdenuItems(BuildContext context) {
    final List<MenuObject> menuTitles = [
      MenuObject(title: 'Home', screen: const TreeListScreen()),
      MenuObject(title: 'BMI Calculator', screen: const BmiScreen()),
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text('Globo Fitness',
            style: TextStyle(color: Colors.white, fontSize: 28))));
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
