import './ressources/theme/theme_green_light.dart';
import './ressources/theme/theme_green_dark.dart';
import './app_config.dart';
import './main_common.dart';

void main() {
  final config = AppConfig(
      appTitle: 'Les arbres marrons',
      lightTheme: greenLightTheme,
      darkTheme: greenDarkTheme);

  mainCommon(config);
}
