import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:globo_fitness/firebase/green_firebase_options.dart'
    as green_firebase_options;
import 'package:globo_fitness/firebase/brown_firebase_options.dart'
    as brown_firebase_options;

import 'package:globo_fitness/screens/home/home_screen.dart';

import 'package:globo_fitness/managers/remote_config_manager.dart';
import 'package:globo_fitness/managers/crash_manager.dart';

import 'package:globo_fitness/injection/app_injection.dart';

import 'package:globo_fitness/app_config.dart';

Future<Widget> initializeApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _firebaseInitializer(appConfig.flavorName);
  await setupInjectionDependencies();
  _activateManagers();

  final AdaptiveThemeMode? savedThemeMode = await AdaptiveTheme.getThemeMode();
  return GlobeApp(
    appConfig: appConfig,
    savedThemeMode: savedThemeMode,
  );
}

class GlobeApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final AppConfig appConfig;

  const GlobeApp({Key? key, this.savedThemeMode, required this.appConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _adaptiveTheme();

  AdaptiveTheme _adaptiveTheme() => AdaptiveTheme(
      light: appConfig.lightTheme,
      dark: appConfig.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (ThemeData lightTheme, ThemeData darkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appConfig.appTitle,
          theme: lightTheme,
          darkTheme: darkTheme,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: const HomeScreen(),
        );
      });
}

Future<void> _firebaseInitializer(FlavorName flavorName) async {
  FirebaseOptions? firebaseOption;

  switch (flavorName) {
    case FlavorName.brown:
      firebaseOption =
          brown_firebase_options.DefaultFirebaseOptions.currentPlatform;
      break;
    case FlavorName.green:
      firebaseOption =
          green_firebase_options.DefaultFirebaseOptions.currentPlatform;
      break;
  }
  await Firebase.initializeApp(options: firebaseOption);
}

void _activateManagers() {
  activateRemoteConfig();
  activateCrashReportIfEnabled();
}
