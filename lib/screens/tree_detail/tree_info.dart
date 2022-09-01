import 'package:flutter/material.dart';

import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:globo_fitness/extensions/string_casing.dart';

Widget rowTreeInfo(
        {required BuildContext context,
        required String title,
        required String value,
        String? unit}) =>
    const Padding(
      padding: EdgeInsets.all(10),
      child: Text("#### Need to be changed ####"),
      // child: Text(context.localized.titleLabel(
      //     title.toTitleCase(),
      //     unit != null
      //         ? context.localized.valueWithUnit(value, unit)
      //         : value.toTitleCase())),
    );
