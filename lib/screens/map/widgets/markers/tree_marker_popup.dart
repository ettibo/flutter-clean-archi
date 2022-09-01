import 'package:flutter/material.dart';

import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:globo_fitness/extensions/string_casing.dart';

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
                  LocaleKeys.titleLabel.tr(
                    args: [
                      LocaleKeys.species.tr(),
                      tree.species.toString().toTitleCase()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
