import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/screens/tree_detail/row_tree_info.dart';

import 'package:globo_fitness/shared/platform_app_bar.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/extensions/string_localized.dart';

class TreeDetailScreen extends StatelessWidget {
  final Tree tree;
  const TreeDetailScreen({Key? key, required this.tree}) : super(key: key);

  PlatformAppBar appBar(BuildContext context) => platformAppBar(
        context: context,
        title: tree.name ?? LocaleKeys.title_detail_tree_screen.localized(),
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
                value: tree.species ??
                    LocaleKeys.tree_list_screen_species_not_specified
                        .localized()),
            rowTreeInfo(
              context: context,
              title: LocaleKeys.tree_detail_screen_address.localized(),
              value: LocaleKeys.tree_detail_screen_value_with_unit.localized(
                  args: {
                    'value': tree.address2.toString(),
                    'unit': tree.address.toString()
                  }),
            ),
            rowTreeInfo(
                context: context,
                title: LocaleKeys.tree_detail_screen_height.localized(),
                value: tree.height.toString(),
                unit: LocaleKeys.tree_detail_screen_meter_unit.localized()),
            rowTreeInfo(
                context: context,
                title: LocaleKeys.tree_detail_screen_circumference.localized(),
                value: tree.circumference.toString(),
                unit:
                    LocaleKeys.tree_detail_screen_centimeter_unit.localized()),
          ],
        ),
      ),
    );
  }
}
