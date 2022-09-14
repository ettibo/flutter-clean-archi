import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/screens/tree_detail/row_tree_info.dart';

import 'package:globo_fitness/shared/platform_app_bar.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/extensions/string_localized.dart';

class TreeDetailScreen extends StatefulWidget {
  final Tree tree;
  const TreeDetailScreen({Key? key, required this.tree}) : super(key: key);

  @override
  State<TreeDetailScreen> createState() => _TreeDetailScreenState();
}

class _TreeDetailScreenState extends State<TreeDetailScreen> {
  PlatformAppBar appBar(BuildContext context) => platformAppBar(
        context: context,
        title: widget.tree.name ??
            LocaleKeys.title_title_detail_tree_screen.localized(),
      );

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowTreeInfo(
                context: context,
                title: LocaleKeys.tree_list_screen_species.localized(),
                value: widget.tree.species ??
                    LocaleKeys.tree_list_screen_species_not_specified
                        .localized()),
            rowTreeInfo(
              context: context,
              title: LocaleKeys.tree_detail_screen_address.localized(),
              value: LocaleKeys.tree_detail_screen_value_with_unit.localized(
                  args: {
                    'value': widget.tree.address2.toString(),
                    'unit': widget.tree.address.toString()
                  }),
            ),
            rowTreeInfo(
                context: context,
                title: LocaleKeys.tree_detail_screen_height.localized(),
                value: widget.tree.height.toString(),
                unit: LocaleKeys.tree_detail_screen_meter_unit.localized()),
            rowTreeInfo(
                context: context,
                title: LocaleKeys.tree_detail_screen_circumference.localized(),
                value: widget.tree.circumference.toString(),
                unit:
                    LocaleKeys.tree_detail_screen_centimeter_unit.localized()),
          ],
        ),
      ),
    );
  }
}
