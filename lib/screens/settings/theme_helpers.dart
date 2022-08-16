import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:globo_fitness/screens/settings/settings_view_model.dart';

extension AdaptativeThemeToDeviceTheme on AdaptiveThemeMode {
  DeviceTheme toDeviceTheme() {
    switch (this) {
      case AdaptiveThemeMode.light:
        return DeviceTheme.light;
      case AdaptiveThemeMode.dark:
        return DeviceTheme.dark;
      case AdaptiveThemeMode.system:
        return DeviceTheme.system;
    }
  }
}
