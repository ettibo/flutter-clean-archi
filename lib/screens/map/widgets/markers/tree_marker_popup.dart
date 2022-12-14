import 'package:flutter/material.dart';

import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/extensions/string_casing.dart';
import 'package:globo_fitness/extensions/string_localized.dart';

class TreeMarkPopup extends StatelessWidget {
  final Tree tree;

  const TreeMarkPopup({Key? key, required this.tree}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(tree.name.toString().toCapitalized()),
                Text(
                  LocaleKeys.tree_detail_screen_title_label.localized(args: {
                    'title': LocaleKeys.tree_list_screen_species.localized(),
                    'value': tree.species.toString().toTitleCase()
                  }),
                ),
              ],
            ),
          ),
        ),
      );
}
