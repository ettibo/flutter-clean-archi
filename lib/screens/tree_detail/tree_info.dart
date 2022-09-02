import 'package:flutter/material.dart';

import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:globo_fitness/extensions/string_casing.dart';

Widget rowTreeInfo(
        {required BuildContext context,
        required String title,
        required String value,
        String? unit}) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        LocaleKeys.titleLabel.tr(
          namedArgs: {
            'title': title.toTitleCase(),
            'unit': unit != null
                ? LocaleKeys.valueWithUnit
                    .tr(namedArgs: {'value': value, 'unit': unit})
                : value.toTitleCase()
          },
        ),
      ),
    );
