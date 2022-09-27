import 'package:flutter/material.dart';

bool isDarkMode({required BuildContext context}) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;
