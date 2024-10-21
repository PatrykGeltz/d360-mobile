import 'package:flutter/material.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/models/side_menu_tile_model.dart';

import 'package:mariner/theme/theme.dart';

import 'package:provider/provider.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const List<SideMenuTileModel> routes = [
      SideMenuTileModel(
        title: 'Profil użytkownika',
        icon: Icons.person,
        route: '/profile'
      ),
      SideMenuTileModel(
          title: 'Ustawienia',
          icon: Icons.settings,
          route: '/app/settings'
      ),
      SideMenuTileModel(
          title: 'O aplikacji',
          icon: Icons.info,
      ),
    ];

    final colors = ThemeColors.of(context);

    return Drawer(
      backgroundColor: colors['background'],
      child: Column(
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(16.0),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: colors['primary'],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24.0,
                      backgroundColor: colors['textSecondary'],
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Jan Kowalski',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: colors['textPrimary']
                          ),
                        ),
                        Text(
                          'tester@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                              color: colors['textSecondary']
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: routes.length,
              itemBuilder: (context, index) {
                final route = routes[index];

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  iconColor: colors['textPrimary'],
                  leading: Icon(route.icon),
                  title: Text(route.title),
                  onTap: () {
                    route.executeWith(context);
                  },
                );
              }
            ),
          ),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              IconButton(onPressed: (){
                Provider.of<ThemeDataProvider>(context, listen: false).switchTheme();
              }, icon: Icon(Provider.of<ThemeDataProvider>(context).getThemeIcon() , size: 45.0,)),
              SizedBox(width: 10.0,)
            ],
          )
        ],
      ),
    );
  }
}
