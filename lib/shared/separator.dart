import 'package:flutter/material.dart';

Padding separatorBuilder(
        {required BuildContext context,
        required int index,
        double? insetAll,
        Color? color,
        double? indent}) =>
    Padding(
      padding: EdgeInsets.all(insetAll ?? 10),
      child: Divider(
        color: color ?? Theme.of(context).dividerColor,
        indent: indent ?? 10,
      ),
    );
