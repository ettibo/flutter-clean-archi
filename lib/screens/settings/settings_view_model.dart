import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:mobx/mobx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:globo_fitness/screens/settings/theme_helpers.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

part 'settings_view_model.g.dart';

enum DeviceTheme { light, dark, system }

class SettingsViewModel = SettingsViewModelBase with _$SettingsViewModel;

abstract class SettingsViewModelBase with Store, ViewModel {
  @observable
  DeviceTheme currentTheme = DeviceTheme.system;

  @override
  void init() {
    _setCurrentTheme();
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
          _displayUpdateLanguageAlert(
              languageCode: languageCode, context: context)
        },
        child: Text(language),
      ),
    );
  }

  void _displayUpdateLanguageAlert(
          {required String languageCode, required BuildContext context}) =>
      showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
          title: Text(LocaleKeys.setting_screen_update_language_alert_title
              .localized()),
          content: Text(LocaleKeys.setting_screen_update_language_alert_content
              .localized()),
          actions: <Widget>[
            PlatformDialogAction(
              child: PlatformText(LocaleKeys
                  .setting_screen_update_language_alert_cancel_button
                  .localized()),
              onPressed: () =>
                  Navigator.of(context, rootNavigator: true).pop('dialog'),
            ),
            PlatformDialogAction(
              child: PlatformText(LocaleKeys
                  .setting_screen_update_language_alert_update_button
                  .localized()),
              onPressed: () async {
                await context.setLocale(Locale(languageCode));
                // ignore: use_build_context_synchronously
                Phoenix.rebirth(context);
              },
            ),
          ],
        ),
      );
}
