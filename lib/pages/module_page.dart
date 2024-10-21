import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/data/section_routes.dart';

@RoutePage()
class ModulePage extends StatelessWidget {
  const ModulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeData = RouteData.of(context);
    final routeChild = routeData.route.children![0];
    final routeSegments = routeChild.segments;

    String title = routeData.title(context);

    if (routeSegments.isNotEmpty) {
      final routeSegment = routeSegments[0];
      final routes = kSectionRoutes[routeData.path] ?? [];

      for (var sectionRoute in routes) {
        if (sectionRoute.route.contains(routeSegment)) {
          title = sectionRoute.title;
          break;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const AutoRouter(),
    );
  }
}
