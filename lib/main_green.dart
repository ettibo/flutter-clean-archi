import 'package:flutter/material.dart';
import 'package:globo_fitness/app_config.dart';
import 'package:globo_fitness/main_common.dart';

import 'ressources/theme/green/theme_green_light.dart';
import 'ressources/theme/green/theme_green_dark.dart';

void main() async {
  final appConfig = AppConfig(
      appTitle: 'Les Arbres Verts',
      lightTheme: greenLightTheme,
      darkTheme: greenDarkTheme);
  Widget app = await initializeApp(appConfig);
  runApp(app);
}
