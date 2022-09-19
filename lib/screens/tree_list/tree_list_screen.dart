import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/screens/tree_list/tree_list_view_model.dart';
import 'package:globo_fitness/screens/tree_detail/tree_detail_screen.dart';

import 'package:globo_fitness/shared/platform_activity_indicator.dart';
import 'package:globo_fitness/shared/platform_list_tile.dart';
import 'package:globo_fitness/shared/platform_separated_listview.dart';
import 'package:globo_fitness/shared/separator.dart';
import 'package:globo_fitness/shared/platform_app_bar.dart';
import 'package:globo_fitness/shared/settings_icon_app_bar.dart';

import 'package:globo_fitness/extensions/state_navigaton.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

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
    return PlatformScaffold(
      appBar: platformAppBar(
        context: context,
        title: LocaleKeys.title_title_tree_list_screen.localized(),
        trailingWidgets: [settingsIconButton(context: context)],
      ),
      body: SafeArea(
        child: Center(
          child: Observer(builder: _observerBuilder),
        ),
      ),
    );
  }

  Widget _observerBuilder(BuildContext context) =>
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
                      child: _separatedListView(),
                    ),
                  ),
                ),
                viewModel.isLoadingTrees
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: getActivityIndicator(context: context),
                      )
                    : const SizedBox.shrink()
              ],
            );

  ListView _separatedListView() => platformSeparatedListView(
        itemBuilder: _itemBuilder,
        itemCount: viewModel.treeStore.countTreeList(),
        separatorBuilder: (context, index) =>
            separatorBuilder(context: context, index: index),
      );

  Widget _itemBuilder(BuildContext context, int index) {
    final Tree tree = viewModel.treeStore.trees[index];
    return platformListTile(
      key: Key(tree.id.toString()),
      trailing: Icon(PlatformIcons(context).rightChevron),
      title: viewModel.getTitle(context, tree.name),
      subtitle: viewModel.getSubtitle(context, tree.species, index),
      onTap: () => navigateTo(screen: TreeDetailScreen(tree: tree)),
    );
  }
}
