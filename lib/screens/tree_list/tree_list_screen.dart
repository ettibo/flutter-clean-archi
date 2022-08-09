import 'package:api/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:globo_fitness/screens/tree_list/tree_list_view_model.dart';
import 'package:globo_fitness/shared/menu_bottom.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';

class TreeListScreen extends StatefulWidget {
  const TreeListScreen({Key? key}) : super(key: key);

  @override
  State<TreeListScreen> createState() => _TreeListScreenState();
}

class _TreeListScreenState extends State<TreeListScreen> {
  final TreeListViewModelBase viewModel =
      DependecyInjection.instance.get<TreeListViewModelBase>();
  final Decoration bodyTextDecoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white70);

  final Decoration bodyDecoration = const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/beach.jpg'), fit: BoxFit.cover));

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Globo Fitness')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Container(
        decoration: bodyDecoration,
        child: Center(
          child: Observer(builder: (context) => ListView(children: _items())),
        ),
      ),
    );
  }

  List<ListTile> _items() {
    List<ListTile> tiles = [];
    for (var item in viewModel.trees) {
      tiles.add(ListTile(title: Text(item.name ?? "")));
    }
    return tiles;
  }
}
