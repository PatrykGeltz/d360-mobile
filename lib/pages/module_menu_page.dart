import 'dart:developer' as console;

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/components/subsection_button.dart';

import 'package:mariner/data/section_routes.dart';

@RoutePage()
class ModuleMenuPage extends StatelessWidget {
  const ModuleMenuPage({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    final routes = kSectionRoutes[route] ?? [];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: ListView.builder(
          itemCount: 2 * routes.length - 1,
          itemBuilder: (context, index) {
            final isDivider = index % 2 == 1;

            if (isDivider) {
              return Divider(color: colors['special']);
            }

            final routeIndex = (index / 2).floor();
            final route = routes[routeIndex];

            return SubsectionButton(
              title: route.title,
              icon: route.icon,
              onPressed: () {
                final router = AutoRouter.of(context);
                console.log('Going to subsection with route: ${route.route}');
                router.pushNamed(route.route);
              },
            );
          }
        )
      )
    );
  }
}
