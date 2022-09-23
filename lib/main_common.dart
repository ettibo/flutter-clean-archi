import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:globo_fitness/firebase/green_firebase_options.dart'
    as green_firebase_options;
import 'package:globo_fitness/firebase/brown_firebase_options.dart'
    as brown_firebase_options;

import 'package:globo_fitness/screens/home/home_screen.dart';

import 'package:globo_fitness/managers/connectionManager/activate_connection_manager.dart';
import 'package:globo_fitness/managers/remote_config_manager.dart';
import 'package:globo_fitness/managers/crash_manager.dart';
import 'package:globo_fitness/injection/app_injection.dart';

import 'package:globo_fitness/app_config.dart';
import 'package:globo_fitness/translations/codegen_loader.g.dart';

Future<Widget> initializeApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _firebaseInitializer(appConfig.flavorName);
  await setupInjectionDependencies();
  await EasyLocalization.ensureInitialized();
  _activateManagers();

  final AdaptiveThemeMode? savedThemeMode = await AdaptiveTheme.getThemeMode();
  return EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('es'), Locale('fr')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    assetLoader: const CodegenLoader(),
    child: Phoenix(
      child: GlobeApp(
        appConfig: appConfig,
        savedThemeMode: savedThemeMode,
      ),
    ),
  );
}

class GlobeApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final AppConfig appConfig;

  const GlobeApp({Key? key, this.savedThemeMode, required this.appConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _adaptiveTheme(context);

  AdaptiveTheme _adaptiveTheme(BuildContext context) => AdaptiveTheme(
      light: appConfig.lightTheme,
      dark: appConfig.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (ThemeData lightTheme, ThemeData darkTheme) {
        return OverlaySupport.global(
         child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appConfig.appTitle,
          theme: lightTheme,
          darkTheme: darkTheme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const HomeScreen(),
        ),
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
  activateConnectionManager();
  activateRemoteConfig();

  if (!kIsWeb) {
    activateCrashReportIfEnabled();
  }
}
