import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeData = RouteData.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(routeData.title(context))
      ),
      body: const Center(child: Text('Ustawienia')),
    );
  }
}
