import 'ressources/theme/theme_brown_light.dart';
import 'ressources/theme/theme_brown_dark.dart';
import './app_config.dart';
import './main_common.dart';

void main() {
  final config = AppConfig(
      appTitle: 'Les arbres marrons',
      lightTheme: brownLightTheme,
      darkTheme: brownDarkTheme);

  mainCommon(config);
}
