import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
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
import 'package:globo_fitness/extensions/string_replace_dot_remote_config.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/shared/platform_text_wrapper.dart';

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
  bool _isCrashManagerEnabled = false;

  @override
  void init() {
    _setCurrentTheme();
    if (!kIsWeb) {
      _crashManager = DependecyInjection.instance.get<CrashManager>();
      _initIsCrashManagerEnabled();
    }
  }

  @override
  void dispose() {}

  @action
  void _setCurrentTheme() {
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
      _setCurrentTheme();
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

    // It's needed to use LocalKeys from String
    return remoteKey.replaceDotInRemoteConfig().localized();
  }

  @action
  void _initIsCrashManagerEnabled() =>
      _isCrashManagerEnabled = _crashManager.isCrashReportingEnabled();

  void _toggleCrashManager(bool _) {
    _crashManager.toogleCrashReporting();
    _isCrashManagerEnabled = !_isCrashManagerEnabled;
  }

  Widget getCrashlyticsWidget(BuildContext context) {
    if (!kIsWeb) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textPlatform(
                  content: LocaleKeys.crash_manager_activated_label.localized(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  context: context),
              PlatformSwitch(
                activeColor: Theme.of(context).primaryColor,
                value: _isCrashManagerEnabled,
                onChanged: _toggleCrashManager,
              ),
            ],
          ),
          // Throw Test Exception Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Theme.of(context).secondaryHeaderColor,
                        width: 0.5),
                  ),
                  child: PlatformTextButton(
                    onPressed: triggerException,
                    child: Text(LocaleKeys.setting_screen_throw_test_exception
                        .localized()),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void triggerException() => throw Exception();

  List<Widget> getLangageListButton(BuildContext context) => [
        _getLangageButton(
            language: LocaleKeys.langage_english_langage.localized(),
            languageCode: 'en',
            context: context),
        _getLangageButton(
            language: LocaleKeys.langage_french_langage.localized(),
            languageCode: 'fr',
            context: context),
        _getLangageButton(
            language: LocaleKeys.langage_spanish_langage.localized(),
            languageCode: 'es',
            context: context)
      ];

  Widget _getLangageButton(
      {required String language,
      required String languageCode,
      required BuildContext context}) {
    if (context.locale.languageCode == languageCode) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PlatformElevatedButton(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(10),
        onPressed: () async => {
          await context.setLocale(Locale(languageCode)),
          // ignore: use_build_context_synchronously
          Phoenix.rebirth(context)
        },
        child: Text(language),
      ),
    );
  }
}
