import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:universal_platform/universal_platform.dart';

Widget textPlatform(
        {required String content, TextStyle? style, TextAlign? textAlign}) =>
    UniversalPlatform.isIOS
        ? PlatformText(
            content,
            style: style ?? _defaultIosStyle,
            textAlign: textAlign,
          )
        : Text(
            content,
            style: style,
            textAlign: textAlign,
          );

TextStyle _defaultIosStyle = const TextStyle(
    color: Colors.white, decoration: TextDecoration.none, fontSize: 14);
