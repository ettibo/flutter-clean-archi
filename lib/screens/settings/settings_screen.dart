import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/screens/settings/settings_view_model.dart';

import 'package:globo_fitness/shared/material_app_bar.dart';
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
    return Scaffold(
      appBar: materialAppBar(
          title: LocaleKeys.title_settings_title_screen.localized()),
      body: SafeArea(
        child: Observer(builder: observerBuilder),
      ),
    );
  }

  Widget observerBuilder(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
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
                    onChanged: (value) =>
                        viewModel.handleThemeChange(value, context),
                  ),
                ],
              ),
              // if (!kIsWeb)
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(LocaleKeys.crash_manager_activated_label.localized()),
              //       Switch(
              //           activeColor: Theme.of(context).primaryColorDark,
              //           value: viewModel.isCrashManagerEnabled,
              //           onChanged: viewModel.toggleCrashManager),
              //     ],
              //   ),
              Text(viewModel.getLabelChangeLanguage().localized()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: viewModel.triggerException,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Text("Throw Test Exception"),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: viewModel.getLangageListButton(context))
            ],
          ),
        ),
      );
}
