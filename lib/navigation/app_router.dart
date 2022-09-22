import 'package:flutter/widgets.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/screens/home/home_screen.dart';
import 'package:globo_fitness/screens/tree_list/tree_list_screen.dart';
import 'package:globo_fitness/screens/tree_detail/tree_detail_screen.dart';
import 'package:globo_fitness/screens/bmi/bmi_screen.dart';
import 'package:globo_fitness/screens/map/map_screen.dart';
import 'package:globo_fitness/screens/settings/settings_screen.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomeScreen,
      initial: true,
      children: [
        AutoRoute(
          path: 'tree',
          name: 'TreeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(page: TreeListScreen, path: ''),
            AutoRoute(page: TreeDetailScreen, path: ''),
          ],
        ),
        AutoRoute(path: 'map', name: 'MapRouter', page: MapScreen),
        AutoRoute(path: 'bmi', name: 'BMIRouter', page: BmiScreen),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: SettingsScreen,
        )
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
