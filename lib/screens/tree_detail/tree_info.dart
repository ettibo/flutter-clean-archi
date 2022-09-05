import 'package:flutter/material.dart';

import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/extensions/string_casing.dart';
import 'package:globo_fitness/extensions/string_localized.dart';

Widget rowTreeInfo(
        {required BuildContext context,
        required String title,
        required String value,
        String? unit}) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        LocaleKeys.tree_detail_screen_title_label.localized(
          args: {
            'title': title.toTitleCase(),
            'unit': unit != null
                ? LocaleKeys.tree_detail_screen_value_with_unit
                    .localized(args: {'value': value, 'unit': unit})
                : value.toTitleCase()
          },
        ),
      ),
    );
