import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';

import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/shared/material_app_bar.dart';
import 'package:globo_fitness/localization/app_localization_context.dart';
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
      appBar: materialAppBar(title: context.localized.settingsTitlePage),
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
                    child: Text(context.localized.theme,
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
                  Text(context.localized.titleLabel(
                      viewModel.getLabelChangeLanguage(),
                      viewModel.getCurrentLocale()))
                ],
              )
            ],
          ),
        ),
      );
}
