import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:api/dependency_injection.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:globo_fitness/shared/material_app_bar.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/screens/settings/settings_view_model.dart';

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
      appBar: materialAppBar(title: LocaleKeys.title_settingsTitlePage.tr()),
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
                    child: Text(LocaleKeys.theme_themeTitle.tr(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(LocaleKeys.crashManager_activatedLabel.tr()),
                  Switch(
                      value: viewModel.isCrashManagerEnabled,
                      onChanged: viewModel.toggleCrashManager),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => throw Exception(),
                    child: const Text("Throw Test Exception"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      viewModel.updateLangage('en', context);
                    },
                    child: const Text("English"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      viewModel.updateLangage('fr', context);
                    },
                    child: const Text("Français"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      viewModel.updateLangage('es', context);
                    },
                    child: const Text("Español"),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
