import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:globo_fitness/screens/tree_list/tree_list_view_model.dart';
import 'package:globo_fitness/shared/menu_bottom.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';
import 'package:globo_fitness/shared/circular_progress_indicator.dart';
import 'package:globo_fitness/extensions/string_casing.dart';

class TreeListScreen extends StatefulWidget {
  const TreeListScreen({Key? key}) : super(key: key);

  @override
  State<TreeListScreen> createState() => _TreeListScreenState();
}

class _TreeListScreenState extends State<TreeListScreen> {
  final TreeListViewModelBase viewModel =
      DependecyInjection.instance.get<TreeListViewModelBase>();

  @override
  void initState() {
    viewModel.process();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Globo Fitness')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Observer(builder: observerBuilder),
    );
  }

  Widget observerBuilder(BuildContext context) => viewModel.trees.isEmpty
      ? getActivityIndicator()
      : ListView.separated(
          itemCount: viewModel.trees.length,
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          shrinkWrap: true);

  Widget itemBuilder(BuildContext context, int index) {
    final Tree tree = viewModel.trees[index];
    return ListTile(
      textColor: Colors.black,
      key: Key(tree.id.toString()),
      title: Text(tree.name ?? ""),
      subtitle: getSubtitle(tree.species, index),
      trailing: const Icon(Icons.arrow_right_outlined),
      // onTap: () => goToDetailTree(context, tree),
    );
  }

  Text getSubtitle(String? subtitle, int index) => Text(subtitle != null
      ? 'Species : $subtitle'.toTitleCase()
      : 'Species Not Speficied');

  Padding separatorBuilder(BuildContext context, int index) => const Padding(
        padding: EdgeInsets.all(10.0),
        child: Divider(
          color: Colors.grey,
          indent: 10,
        ),
      );
}
