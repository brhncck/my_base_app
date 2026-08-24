import 'package:auto_route/auto_route.dart';
import 'package:my_base_app/core/config/router/app_router.dart';

abstract final class AppNavigation {
  static Future<T?> push<T extends Object?>(
    PageRouteInfo route, {
    OnNavigationFailure? onFailure,
  }) {
    return AppRouter().push<T>(route, onFailure: onFailure);
  }

  static Future<T?> replace<T extends Object?>(
    PageRouteInfo route, {
    OnNavigationFailure? onFailure,
  }) {
    return AppRouter().replace<T>(route, onFailure: onFailure);
  }

  static Future<bool> pop<T extends Object?>([T? result]) {
    return AppRouter().maybePop<T>(result);
  }
}
