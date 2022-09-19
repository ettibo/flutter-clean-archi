import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Widget getActivityIndicator({BuildContext? context}) => Center(
      child: PlatformCircularProgressIndicator(
        cupertino: (context, __) => CupertinoProgressIndicatorData(
            color: Theme.of(context).indicatorColor),
        material: (context, _) => MaterialProgressIndicatorData(
          color: Theme.of(context).indicatorColor,
        ),
      ),
    );
