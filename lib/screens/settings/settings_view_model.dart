import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:mobx/mobx.dart';

import 'package:api/dependency_injection.dart';
import 'package:api/models/app/managers/remote_config.dart';
import 'package:api/models/app/managers/crash.dart';

import 'package:flutter/material.dart';

import 'package:globo_fitness/screens/settings/theme_helpers.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/localization/app_localization_context.dart';
import 'package:globo_fitness/enums/remote_config_keys.dart';

part 'settings_view_model.g.dart';

enum DeviceTheme { light, dark, system }

class SettingsViewModel = SettingsViewModelBase with _$SettingsViewModel;

abstract class SettingsViewModelBase with Store, ViewModel {
  final RemoteConfigManager remoteConfigManager =
      DependecyInjection.instance.get<RemoteConfigManager>();

  final CrashManager crashManager =
      DependecyInjection.instance.get<CrashManager>();

  @observable
  DeviceTheme currentTheme = DeviceTheme.system;

  @observable
  bool isCrashManagerEnabled = false;

  @override
  void init() {
    setCurrentTheme();
    _initIsCrashManagerEnabled();
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

  String getLabelChangeLanguage() =>
      remoteConfigManager.getValue<String>(
          key: RemoteConfigKeys.key_label_force_language_setting.name) ??
      "";

  String getCurrentLocale() => Platform.localeName;

  @action
  void _initIsCrashManagerEnabled() =>
      isCrashManagerEnabled = crashManager.isCrashReportingEnabled();

  void toggleCrashManager(bool _) {
    crashManager.toogleCrashReporting();
    isCrashManagerEnabled = !isCrashManagerEnabled;
  }
}
