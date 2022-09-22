// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomeScreen());
    },
    TreeRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    MapRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const MapScreen());
    },
    BMIRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const BmiScreen());
    },
    SettingsRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SettingsScreen());
    },
    TreeListRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const TreeListScreen());
    },
    TreeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TreeDetailRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: TreeDetailScreen(key: args.key, tree: args.tree));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', children: [
          RouteConfig(TreeRouter.name,
              path: 'tree',
              parent: HomeRoute.name,
              children: [
                RouteConfig(TreeListRoute.name,
                    path: '', parent: TreeRouter.name),
                RouteConfig(TreeDetailRoute.name,
                    path: '', parent: TreeRouter.name)
              ]),
          RouteConfig(MapRouter.name, path: 'map', parent: HomeRoute.name),
          RouteConfig(BMIRouter.name, path: 'bmi', parent: HomeRoute.name),
          RouteConfig(SettingsRouter.name,
              path: 'settings', parent: HomeRoute.name)
        ]),
        RouteConfig('*#redirect', path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [EmptyRouterPage]
class TreeRouter extends PageRouteInfo<void> {
  const TreeRouter({List<PageRouteInfo>? children})
      : super(TreeRouter.name, path: 'tree', initialChildren: children);

  static const String name = 'TreeRouter';
}

/// generated route for
/// [MapScreen]
class MapRouter extends PageRouteInfo<void> {
  const MapRouter() : super(MapRouter.name, path: 'map');

  static const String name = 'MapRouter';
}

/// generated route for
/// [BmiScreen]
class BMIRouter extends PageRouteInfo<void> {
  const BMIRouter() : super(BMIRouter.name, path: 'bmi');

  static const String name = 'BMIRouter';
}

/// generated route for
/// [SettingsScreen]
class SettingsRouter extends PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [TreeListScreen]
class TreeListRoute extends PageRouteInfo<void> {
  const TreeListRoute() : super(TreeListRoute.name, path: '');

  static const String name = 'TreeListRoute';
}

/// generated route for
/// [TreeDetailScreen]
class TreeDetailRoute extends PageRouteInfo<TreeDetailRouteArgs> {
  TreeDetailRoute({Key? key, required Tree tree})
      : super(TreeDetailRoute.name,
            path: '', args: TreeDetailRouteArgs(key: key, tree: tree));

  static const String name = 'TreeDetailRoute';
}

class TreeDetailRouteArgs {
  const TreeDetailRouteArgs({this.key, required this.tree});

  final Key? key;

  final Tree tree;

  @override
  String toString() {
    return 'TreeDetailRouteArgs{key: $key, tree: $tree}';
  }
}
