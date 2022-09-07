import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:universal_platform/universal_platform.dart';

Widget textPlatform(
        {required String content, TextStyle? style, TextAlign? textAlign}) =>
    UniversalPlatform.isAndroid
        ? Text(
            content,
            style: style,
            textAlign: textAlign,
          )
        : PlatformText(
            content,
            style: style,
            textAlign: textAlign,
          );
