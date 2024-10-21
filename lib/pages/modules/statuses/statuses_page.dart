import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StatusesPage extends StatelessWidget {
  static const String id = '/statuses';

  const StatusesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeData = RouteData.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(routeData.title(context))
      ),
      body: const Center(child: Text('Statusy'))
    );
  }
}
