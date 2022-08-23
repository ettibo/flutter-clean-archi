import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/screens/tree_list/tree_list_view_model.dart';
import 'package:globo_fitness/screens/tree_detail/tree_detail_screen.dart';

import 'package:globo_fitness/shared/circular_progress_indicator.dart';
import 'package:globo_fitness/shared/separator.dart';

import 'package:globo_fitness/extensions/state_navigaton.dart';

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
      body: Observer(builder: observerBuilder),
    );
  }

  Widget observerBuilder(BuildContext context) =>
      viewModel.treeStore.isTreeListEmpty()
          ? getActivityIndicator(context: context)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: viewModel.handleScroll,
                    child: RefreshIndicator(
                      onRefresh: viewModel.onListRefresh,
                      child: separatedListView(),
                    ),
                  ),
                ),
                viewModel.isLoadingTrees
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: getActivityIndicator(context: context),
                      )
                    : Container()
              ],
            );

  ListView separatedListView() => ListView.separated(
        itemCount: viewModel.treeStore.countTreeList(),
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) =>
            separatorBuilder(context: context, index: index),
        shrinkWrap: true,
      );

  Widget itemBuilder(BuildContext context, int index) {
    final Tree tree = viewModel.treeStore.trees[index];
    return ListTile(
      key: Key(tree.id.toString()),
      title: viewModel.getTitle(context, tree.name),
      subtitle: viewModel.getSubtitle(context, tree.species, index),
      trailing: const Icon(Icons.arrow_right_outlined),
      onTap: () => navigateTo(TreeDetailScreen(tree: tree)),
    );
  }
}
