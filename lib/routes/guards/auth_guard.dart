import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mariner/routes/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final loggedIn = preferences.getBool('loggedIn') ?? false;

    if (loggedIn) {
      resolver.next(true);
    } else {
      router.push(LoginRoute(onSuccess: () {
        resolver.next(true);
        router.removeLast();
      }));
    }
  }
}