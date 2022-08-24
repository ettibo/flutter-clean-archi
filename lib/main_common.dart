import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:globo_fitness/firebase_options.dart';

import 'package:globo_fitness/screens/home/home_screen.dart';

import 'package:globo_fitness/managers/remote_config_manager.dart';

import 'package:globo_fitness/injection/app_injection.dart';

import 'package:globo_fitness/app_config.dart';

void mainCommon({required AppConfig appConfig}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await _firebaseInitializer();
  await setupInjectionDependencies();
  _activateManagers();

  final AdaptiveThemeMode? savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(GlobeApp(
    savedThemeMode: savedThemeMode,
    appConfig: appConfig,
  ));
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
          // onGenerateTitle: (context) => context.localized.appTitle,
          title: appConfig.appTitle,
          theme: lightTheme,
          darkTheme: darkTheme,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: const HomeScreen(),
        );
      });
}

Future<void> _firebaseInitializer() async => await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

void _activateManagers() => activateRemoteConfig();
