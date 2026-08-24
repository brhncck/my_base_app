import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_base_app/core/config/router/app_route_transitions.dart';
import 'package:my_base_app/core/config/router/global_nav.dart';
import 'package:my_base_app/features/dashboard/pages/dashboard_page.dart';
import 'package:my_base_app/features/get_started/pages/get_started_page.dart';
import 'package:my_base_app/features/onboarding/pages/onboarding_page.dart';
import 'package:my_base_app/features/paywall/pages/paywall_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter._({GlobalKey<NavigatorState>? navigatorKey})
    : super(navigatorKey: navigatorKey ?? rootNavigatorKey);

  static final AppRouter _instance = AppRouter._();

  factory AppRouter() => _instance;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GetStartedRoute.page, path: '/', initial: true),
    AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),
    CustomRoute(
      page: PaywallRoute.page,
      path: '/paywall',
      fullscreenDialog: true,
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 300),
      transitionsBuilder: AppRouteTransitions.modal,
    ),
    AutoRoute(page: DashboardRoute.page, path: '/dashboard'),
  ];
}
