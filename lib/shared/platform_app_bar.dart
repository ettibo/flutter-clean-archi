import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

PlatformAppBar platformAppBar(
        {required BuildContext context,
        required String title,
        Widget? leading,
        List<Widget>? trailingWidgets,
        Color? backgroundColor}) =>
    PlatformAppBar(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      leading: leading,
      trailingActions: trailingWidgets,
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      material: (context, _) => MaterialAppBarData(
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
      ),
    );
