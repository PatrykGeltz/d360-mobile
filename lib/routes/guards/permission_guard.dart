import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mariner/routes/app_router.dart';

class PermissionGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next(true);
  }
}