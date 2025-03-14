import 'package:dyi_controller/ui/screens/connect_device/connect_device_screen.dart';
import 'package:dyi_controller/ui/screens/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../core/models/app_route.dart';

final appRouter = GoRouter(
  initialLocation: ConnectDevice().generatePath(),
  routes: [
    GoRoute(
      path: ConnectDevice().generatePath(),
      builder: (context, state) => const ConnectDeviceScreen(),
    ),
    GoRoute(
      path: Home(':deviceId').generatePath(),
      builder: (context, state) {
        final deviceId = state.pathParameters['deviceId']!;
        return HomeScreen(deviceId: deviceId);
      },
    ),
  ],
);

extension AppRouteHelper on AppRoute {
  String generatePath()  {
    var route = this;
    return switch (route) {
      ConnectDevice() => '/connect-device',
      Home() => '/home/${route.id}',
    };
  }
}

extension AppRouterHelper on BuildContext {
  void go(AppRoute route, {Object? extra}) =>
      GoRouter.of(this).go(route.generatePath(), extra: extra);
}
