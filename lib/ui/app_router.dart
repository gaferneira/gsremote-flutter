import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dependencies.dart';
import '/ui/screens/connect_device/connect_device_screen.dart';
import '/ui/screens/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../core/models/app_route.dart';

GoRouter appRouter(WidgetRef ref) => GoRouter(
  routes: [
    GoRoute(
      path: ConnectDevice().generatePath(),
      builder: (context, state) => const ConnectDeviceScreen(),
    ),
    GoRoute(
      path: Home().generatePath(),
      builder: (context, state) {
        return HomeScreen();
      },
    ),
  ],
  redirect: (context, state) async {
    var path = state.fullPath;
    if (path == null || path.isEmpty) {
      final isDeviceSetup = await ref.read(bluetoothRepositoryProvider).isDeviceSetup();
      if (isDeviceSetup) {
        return Home().generatePath();
      }
      return ConnectDevice().generatePath();
    }
    return null;
  }
);

extension AppRouteHelper on AppRoute {
  String generatePath()  {
    var route = this;
    return switch (route) {
      ConnectDevice() => '/connect-device',
      Home() => '/home',
    };
  }
}

extension AppRouterHelper on BuildContext {
  void go(AppRoute route, {Object? extra}) =>
      GoRouter.of(this).go(route.generatePath(), extra: extra);
}
