import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:universal_platform/universal_platform.dart';

extension StateNavigation on State {
  void navigateTo({required Widget screen}) => Navigator.of(context).push(
        UniversalPlatform.isIOS
            ? CupertinoPageRoute(builder: (context) => screen)
            : MaterialPageRoute(
                builder: (context) => screen,
              ),
      );
}
