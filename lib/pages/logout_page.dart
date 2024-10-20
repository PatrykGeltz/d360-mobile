import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    if (context.mounted) {
      final router = AutoRouter.of(context);
      router.pushNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    _logout(context);

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
