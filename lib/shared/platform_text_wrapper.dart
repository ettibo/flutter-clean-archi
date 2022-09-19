import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:universal_platform/universal_platform.dart';

Widget textPlatform(
        {required String content,
        required BuildContext context,
        TextStyle? style,
        TextAlign? textAlign}) =>
    UniversalPlatform.isIOS
        ? PlatformText(
            content,
            style: style ?? _defaultTextIosStyle(context: context),
            textAlign: textAlign,
          )
        : Text(
            content,
            style: style,
            textAlign: textAlign,
          );

TextStyle _defaultTextIosStyle({required BuildContext context}) => TextStyle(
    color: Theme.of(context).secondaryHeaderColor,
    decoration: TextDecoration.none,
    fontSize: 16,
    fontWeight: FontWeight.normal);
