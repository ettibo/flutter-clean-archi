import 'package:flutter/material.dart';
import 'package:globo_fitness/main.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [];

    for (var item in GlobeApp.navigationList) {
      items.add(
          BottomNavigationBarItem(icon: Icon(item.icon), label: item.title));
    }

    void onTap(int index) {
      Navigator.pushNamed(context, GlobeApp.navigationList[index].route);
    }

    return BottomNavigationBar(items: items, onTap: onTap);
  }
}
