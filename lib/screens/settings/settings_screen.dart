import 'package:flutter/material.dart';

import 'package:globo_fitness/shared/material_app_bar.dart';
import 'package:globo_fitness/localization/app_localization_context.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AppBar appBar(BuildContext context) =>
      materialAppBar(title: context.localized.settingsTitlePage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: const SafeArea(
        child: Center(
          child: Text("Settings"),
        ),
      ),
    );
  }
}
