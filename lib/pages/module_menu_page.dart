import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/components/subsections/subsection_button.dart';
import 'package:mariner/components/subsections/subsection_list.dart';

@RoutePage()
class ModuleMenuPage extends StatelessWidget {
  const ModuleMenuPage({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    final List buttons = kSubsections[route]?.toList() ?? const [SubsectionButton(icon: Icons.close, title: 'Brak podsekcji')];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: ListView.builder(
          itemCount: buttons.length,
          itemBuilder: (context, index) {
            final button = buttons[index];

            return Column(
              children: [
                SubsectionButton(title: button.title, icon: button.icon, route: button.route),
                Divider(color: colors['special'],)
              ],
            );
          }
        )
      )
    );
  }
}
