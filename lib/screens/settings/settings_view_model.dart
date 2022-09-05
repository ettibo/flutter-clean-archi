import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mobx/mobx.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:api/dependency_injection.dart';
import 'package:api/models/app/managers/remote_config.dart';
import 'package:api/models/app/managers/crash.dart';

import 'package:flutter/material.dart';

import 'package:globo_fitness/screens/settings/theme_helpers.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/enums/remote_config_keys.dart';

part 'settings_view_model.g.dart';

enum DeviceTheme { light, dark, system }

class SettingsViewModel = SettingsViewModelBase with _$SettingsViewModel;

abstract class SettingsViewModelBase with Store, ViewModel {
  final RemoteConfigManager _remoteConfigManager =
      DependecyInjection.instance.get<RemoteConfigManager>();

  final CrashManager _crashManager =
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
            child: Text(LocaleKeys.theme_lightTheme.tr())),
        DropdownMenuItem(
            value: DeviceTheme.dark,
            child: Text(LocaleKeys.theme_darkTheme.tr())),
        DropdownMenuItem(
            value: DeviceTheme.system,
            child: Text(LocaleKeys.theme_mirrorSystem.tr()))
      ];

  String getLabelChangeLanguage() =>
      _remoteConfigManager.getValue<String>(
          key: RemoteConfigKeys.key_label_force_language_setting.name) ??
      "";

  String getCurrentLocale() => Platform.localeName;

  @action
  void _initIsCrashManagerEnabled() =>
      isCrashManagerEnabled = _crashManager.isCrashReportingEnabled();

  void toggleCrashManager(bool _) {
    _crashManager.toogleCrashReporting();
    isCrashManagerEnabled = !isCrashManagerEnabled;
  }

  @action
  void updateLangage(String langageCode, BuildContext context) async {
    await context.setLocale(Locale(langageCode));
    // ignore: use_build_context_synchronously
    Phoenix.rebirth(context);
  }
}
