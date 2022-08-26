import 'package:flutter/material.dart';

import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/localization/app_localization_context.dart';
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
                Text(context.localized.titleLabel(context.localized.species,
                    tree.species.toString().toTitleCase())),
              ],
            ),
          ),
        ),
      );
}