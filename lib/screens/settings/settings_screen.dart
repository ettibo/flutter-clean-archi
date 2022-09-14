import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/screens/settings/settings_view_model.dart';

import 'package:globo_fitness/shared/platform_app_bar.dart';
import 'package:globo_fitness/shared/platform_text_wrapper.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsViewModelBase viewModel =
      DependecyInjection.instance.get<SettingsViewModelBase>();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: platformAppBar(
        context: context,
        title: LocaleKeys.title_settings_title_screen.localized(),
      ),
      body: Observer(builder: _observerBuilder),
    );
  }

  Widget _observerBuilder(BuildContext context) => Center(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _switchThemeSection(),
                viewModel.getCrashlyticsWidget(context),
                _switchLanguageSection(),
              ],
            ),
          ),
        ),
      );

  Widget _switchThemeSection() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(LocaleKeys.theme_theme_title.localized(),
                style: const TextStyle(fontSize: 18)),
          ),
          DropdownButton<DeviceTheme>(
            value: viewModel.currentTheme,
            items: viewModel.getDropdownItems(context),
            onChanged: (value) => viewModel.handleThemeChange(value, context),
          ),
        ],
      );

  Widget _switchLanguageSection() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textPlatform(
                    content: LocaleKeys
                        .setting_screen_switch_language_description
                        .localized(),
                    context: context),
              ],
            ),
          ),
          // Switch Languages Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: viewModel.getLangageListButton(context),
          )
        ],
      );
}
