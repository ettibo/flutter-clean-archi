import 'package:flutter/material.dart';

class AppConfig {
  AppConfig(
      {required this.appTitle,
      required this.lightTheme,
      required this.darkTheme});

  final String appTitle;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
}
