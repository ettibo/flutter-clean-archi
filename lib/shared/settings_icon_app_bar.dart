import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:globo_fitness/screens/settings/settings_screen.dart';

import 'package:globo_fitness/shared/navigation_helper.dart';

PlatformIconButton settingsIconButton({required BuildContext context}) =>
    PlatformIconButton(
      icon: Icon(PlatformIcons(context).settings),
      onPressed: () =>
          navigateTo(screen: const SettingsScreen(), context: context),
      cupertino: (_, __) => CupertinoIconButtonData(padding: EdgeInsets.zero),
      material: ((context, _) =>
          MaterialIconButtonData(color: Theme.of(context).primaryColor)),
    );
