import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:globo_fitness/extensions/string_replace_dot_remote_config.dart';
import 'package:mobx/mobx.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:api/dependency_injection.dart';
import 'package:api/models/app/managers/remote_config.dart';
import 'package:api/models/app/managers/crash.dart';

import 'package:globo_fitness/screens/settings/theme_helpers.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/enums/remote_config_keys.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

part 'settings_view_model.g.dart';

enum DeviceTheme { light, dark, system }

class SettingsViewModel = SettingsViewModelBase with _$SettingsViewModel;

abstract class SettingsViewModelBase with Store, ViewModel {
  final RemoteConfigManager _remoteConfigManager =
      DependecyInjection.instance.get<RemoteConfigManager>();

  late CrashManager _crashManager;

  @observable
  DeviceTheme currentTheme = DeviceTheme.system;

  @observable
  bool isCrashManagerEnabled = false;

  @override
  void init() {
    setCurrentTheme();
    if (!kIsWeb) {
      _crashManager = DependecyInjection.instance.get<CrashManager>();
      _initIsCrashManagerEnabled();
    }
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
            child: Text(LocaleKeys.theme_light_theme.localized())),
        DropdownMenuItem(
            value: DeviceTheme.dark,
            child: Text(LocaleKeys.theme_dark_theme.localized())),
        DropdownMenuItem(
            value: DeviceTheme.system,
            child: Text(LocaleKeys.theme_mirror_system.localized()))
      ];

  String getLabelChangeLanguage() {
    String remoteKey = _remoteConfigManager.getValue<String>(
            key: RemoteConfigKeys
                .remote_config_key_label_force_language_setting.name) ??
        "";
    remoteKey = remoteKey.replaceDotInRemoteConfig().localized();
    return remoteKey;
  }

  String getCurrentLocale() => Platform.localeName;

  @action
  void _initIsCrashManagerEnabled() =>
      isCrashManagerEnabled = _crashManager.isCrashReportingEnabled();

  void toggleCrashManager(bool _) {
    _crashManager.toogleCrashReporting();
    isCrashManagerEnabled = !isCrashManagerEnabled;
  }

  Row getCrashlyticsRow(BuildContext context) {
    if (!kIsWeb) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(LocaleKeys.crash_manager_activated_label.localized()),
          Switch(
              activeColor: Theme.of(context).primaryColorDark,
              value: isCrashManagerEnabled,
              onChanged: toggleCrashManager),
        ],
      );
    } else {
      return Row();
    }
  }

  List<ElevatedButton> getLangageListButton(BuildContext context) => [
        getLangageButton(
            LocaleKeys.langage_english_langage.localized(), 'en', context),
        getLangageButton(
            LocaleKeys.langage_french_langage.localized(), 'fr', context),
        getLangageButton(
            LocaleKeys.langage_spanish_langage.localized(), 'es', context)
      ];

  ElevatedButton getLangageButton(
          String langage, String langageCode, BuildContext context) =>
      ElevatedButton(
        onPressed: () async {
          await context.setLocale(Locale(langageCode));
          // ignore: use_build_context_synchronously
          Phoenix.rebirth(context);
        },
        child: Text(langage),
      );

  void triggerException() => throw Exception();
}
