import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:globo_fitness/navigation/app_router.dart';

import 'package:globo_fitness/managers/connectionManager/activate_connection_manager.dart';
import 'package:globo_fitness/injection/app_injection.dart';

import 'package:globo_fitness/app_config.dart';
import 'package:globo_fitness/translations/codegen_loader.g.dart';

Future<Widget> initializeApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
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
  final AppRouter appRouter = AppRouter();

  GlobeApp({
    Key? key,
    this.savedThemeMode,
    required this.appConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _adaptiveTheme(context);

  AdaptiveTheme _adaptiveTheme(BuildContext context) => AdaptiveTheme(
      light: appConfig.lightTheme,
      dark: appConfig.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (ThemeData lightTheme, ThemeData darkTheme) {
        return OverlaySupport.global(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            title: appConfig.appTitle,
            theme: lightTheme,
            darkTheme: darkTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        );
      });
}

void _activateManagers() {
  activateConnectionManager();
}
