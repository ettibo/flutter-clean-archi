import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/home/home_screen.dart';
import 'injection/app_injection.dart';
import 'package:globo_fitness/models/navigation_object.dart';
import 'package:globo_fitness/screens/bmi/bmi_screen.dart';
import 'package:globo_fitness/screens/tree_list/tree_list_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:globo_fitness/localization/app_localization_context.dart';

void main() {
  setupInjectionDependencies();
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => context.localized.appTitle,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const HomeScreen(),
    );
  }

  // Map<String, WidgetBuilder> _generateNavigation(BuildContext context) {
  //   Map<String, WidgetBuilder> map = <String, WidgetBuilder>{};
  //   for (var item in navigationList) {
  //     map[item.route] = ((context) => item.screen);
  //   }
  //   return map;
  // }
}
