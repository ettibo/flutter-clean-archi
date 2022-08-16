import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:globo_fitness/screens/home/home_screen.dart';

import 'package:globo_fitness/ressources/theme/theme_dark.dart';
import 'package:globo_fitness/ressources/theme/theme_light.dart';

import 'package:globo_fitness/injection/app_injection.dart';
import 'package:globo_fitness/localization/app_localization_context.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjectionDependencies();
  final AdaptiveThemeMode? savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(GlobeApp(savedThemeMode: savedThemeMode));
}

class GlobeApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const GlobeApp({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return adaptiveTheme(context);
  }

  AdaptiveTheme adaptiveTheme(BuildContext context) => AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (ThemeData lightTheme, ThemeData darkTheme) =>
          materialApp(context, lightTheme, darkTheme));

  MaterialApp materialApp(
          BuildContext context, ThemeData theme, ThemeData darktheme) =>
      MaterialApp(
        onGenerateTitle: (context) => context.localized.appTitle,
        theme: theme,
        darkTheme: darkTheme,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: const HomeScreen(),
      );
}
