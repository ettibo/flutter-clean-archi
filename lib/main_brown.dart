import 'ressources/theme/brown/theme_brown_light.dart';
import 'ressources/theme/brown/theme_brown_dark.dart';
import './app_config.dart';
import './main_common.dart';

void main() {
  final config = AppConfig(
      appTitle: 'Les Arbres Marrons',
      lightTheme: brownLightTheme,
      darkTheme: brownDarkTheme);

  mainCommon(config);
}
