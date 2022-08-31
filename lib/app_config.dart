import 'package:flutter/material.dart';

enum FlavorName { brown, green }

class AppConfig {
  AppConfig(
      {required this.appTitle,
      required this.lightTheme,
      required this.darkTheme,
      required this.flavorName});

  final String appTitle;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final FlavorName flavorName;
}
