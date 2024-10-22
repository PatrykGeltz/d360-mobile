import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/components/section_button.dart';
import 'package:mariner/components/side_menu.dart';

import 'package:mariner/data/main_routes.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    const routes = kMainRoutes;
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
          itemCount: routes.length,
          itemBuilder: (context, index) {
            final route = routes[index];

            return SectionButton(
              title: route.title,
              icon: route.icon,
              onPressed: () {
                final router = AutoRouter.of(context);

                router.pushNamed(route.route);
              },
            );
          },
        ),
      ),
    );
  }
}
