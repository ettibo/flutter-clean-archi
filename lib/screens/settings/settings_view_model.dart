import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/localization/app_localization_context.dart';

import 'package:globo_fitness/screens/settings/theme_helpers.dart';

part 'settings_view_model.g.dart';

enum DeviceTheme { light, dark, system }

class SettingsViewModel = SettingsViewModelBase with _$SettingsViewModel;

abstract class SettingsViewModelBase with Store, ViewModel {
  @observable
  DeviceTheme currentTheme = DeviceTheme.system;

  @override
  void init() {
    setCurrentTheme();
  }

  @override
  void dispose() {}

  @action
  void setCurrentTheme() {
    AdaptiveTheme.getThemeMode().then((AdaptiveThemeMode? theme) {
      if (theme != null) {
        currentTheme = theme.toDeviceTheme();
      }
    });
  }

  void handleThemeChange(DeviceTheme? newTheme, BuildContext context) {
    if (newTheme != null) {
      switch (newTheme) {
        case DeviceTheme.light:
          AdaptiveTheme.of(context).setLight();
          break;
        case DeviceTheme.dark:
          AdaptiveTheme.of(context).setDark();
          break;
        case DeviceTheme.system:
          AdaptiveTheme.of(context).setSystem();
          break;
      }
      setCurrentTheme();
    }
  }

  List<DropdownMenuItem<DeviceTheme>> getDropdownItems(BuildContext context) =>
      [
        DropdownMenuItem(
            value: DeviceTheme.light,
            child: Text(context.localized.lightTheme)),
        DropdownMenuItem(
            value: DeviceTheme.dark, child: Text(context.localized.darkTheme)),
        DropdownMenuItem(
            value: DeviceTheme.system,
            child: Text(context.localized.mirrorSystem))
      ];
}