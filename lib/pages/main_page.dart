import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/models/section_button_model.dart';

import 'package:mariner/components/dashboard/section_button.dart';
import 'package:mariner/components/side_menu.dart';
import 'package:mariner/pages/subsections_page.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  static const String id = '/main';

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<SectionButtonModel> buttons = [
      SectionButtonModel(
          title: 'Członkowie',
          icon: Icons.person,
          route: '/members',
          hasSubSec: true
      ),
      SectionButtonModel(
          title: 'Składki',
          icon: Icons.monetization_on,
          route: '/contributions',
          hasSubSec: true
      ),
      SectionButtonModel(
          title: 'Uprawnienia żeglarskie',
          icon: Icons.note_add,
          route: '/sailor_permissions',
          hasSubSec: true
      ),
      SectionButtonModel(
          title: 'Marina',
          icon: Icons.waves,
          route: '/marina',
          hasSubSec: true
      ),
      SectionButtonModel(
        title: 'Statusy',
        icon: Icons.star,
        route: '/statuses'
      ),
      SectionButtonModel(
        title: 'Ustawienia klubu',
        icon: Icons.settings,
        route: '/settings'
      ),
    ];

    final colors = ThemeColors.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'MARINER',
            style: TextStyle(
                color: colors['textPrimary'],
                fontWeight: FontWeight.w700
            )
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: colors['textPrimary'],
            ),
            onPressed: () {
              // final prefs = await SharedPreferences.getInstance();
              // prefs.setBool('loggedIn', false);
              // Navigator.pushReplacementNamed(context, '/login');
              final router = AutoRouter.of(context);
              router.replaceNamed('/logout');
            },
          ),
        ],
      ),
      drawer: const SideMenu(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: buttons.length,
          itemBuilder: (context, index) {
            final button = buttons[index];

            return SectionButton(
              title: button.title,
              icon: button.icon,
              onPressed: () {
                // if (button.hasSubSec && button.hasRoute) {
                //   Navigator.pushNamed(context, SectionsPage.id, arguments: button.route);
                // } else if (!button.hasSubSec && button.hasRoute) {
                //   Navigator.pushNamed(context, button.route.toString() );
                // }
                if (button.hasRoute) {
                  final router = AutoRouter.of(context);
                  print(button.route);
                  router.pushNamed(button.route!);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
