import 'package:flutter/material.dart';

import 'package:globo_fitness/localization/app_localization_context.dart';
import 'package:globo_fitness/extensions/string_casing.dart';

Widget rowTreeInfo(
        {required BuildContext context,
        required String title,
        required String value,
        String? unit}) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(context.localized.titleLabel(
          title.toTitleCase(),
          unit != null
              ? context.localized.valueWithUnit(value, unit)
              : value.toTitleCase())),
    );
