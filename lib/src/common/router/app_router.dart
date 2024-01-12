import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_hello/src/features/features.dart';

part 'app_router.gr.dart'; // flutter packages pub run build_runner watch

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        CustomRoute(
          page: TabsRoute.page,
          path: '/tabs-screen',
          children: <AutoRoute>[
            RedirectRoute(path: '', redirectTo: 'home-tab'),
            CupertinoRoute(page: HomeRoute.page, path: 'home-tab'),
            CupertinoRoute(page: ExploreRoute.page, path: 'explore-tab'),
            CupertinoRoute(page: SettingsRoute.page, path: 'settings-tab'),
          ],
        ),
      ];
}
