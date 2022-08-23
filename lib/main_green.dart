import 'ressources/theme/green/theme_green_light.dart';
import 'ressources/theme/green/theme_green_dark.dart';
import './app_config.dart';
import './main_common.dart';

void main() {
  final config = AppConfig(
      appTitle: 'Les Arbres Verts',
      lightTheme: greenLightTheme,
      darkTheme: greenDarkTheme);

  mainCommon(config);
}
