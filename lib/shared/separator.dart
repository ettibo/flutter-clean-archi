import 'package:flutter/material.dart';

Padding separatorBuilder(
        {required BuildContext context,
        required int index,
        double insetAll = 10.0,
        Color color = Colors.blueGrey,
        double indent = 10}) =>
    Padding(
      padding: EdgeInsets.all(insetAll),
      child: Divider(
        color: color,
        indent: indent,
      ),
    );
