import 'package:globo_fitness/app_config.dart';
import 'package:globo_fitness/main_common.dart';

import 'ressources/theme/brown/theme_brown_light.dart';
import 'ressources/theme/brown/theme_brown_dark.dart';

void main() {
  final appConfig = AppConfig(
      appTitle: 'Les Arbres Marrons',
      lightTheme: brownLightTheme,
      darkTheme: brownDarkTheme);

  mainCommon(appConfig: appConfig);
}
