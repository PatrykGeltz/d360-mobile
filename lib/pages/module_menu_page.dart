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

    // final List buttons = kSubsections[route]?.toList() ?? const [SubsectionButton(icon: Icons.close, title: 'Brak podsekcji')];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: ListView.builder(
          itemCount: routes.length,
          itemBuilder: (context, index) {
            final route = routes[index];

            return Column(
              children: [
                SubsectionButton(
                  title: route.title,
                  icon: route.icon,
                  onPressed: () {
                    final router = AutoRouter.of(context);
                    print('Going to subsection with route: ${route.route}');
                    router.pushNamed(route.route);
                  },
                ),
                Divider(
                  color: colors['special'],
                )
              ],
            );
          }
        )
      )
    );
  }
}
