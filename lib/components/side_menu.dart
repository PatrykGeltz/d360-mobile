import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:mariner/theme/theme.dart';
import 'package:mariner/theme/colors.dart';

import 'package:mariner/models/side_menu_tile_model.dart';

import 'package:mariner/providers/user_provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String userName = '...';
  String userEmail = '...';
  String avatarUrl = '';
  String appVersion = '1.0.0';

  late UserProvider user;
  late UserProvider userSet;

  @override
  void initState() {
    super.initState();
    _fetchUserData();

    _fetchAppVersion();
  }

  Future<void> _fetchUserData() async {
    const url = 'https://acme-dev.d360.pl/api/v1/user';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");
    try {
      final response = await http.get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        setState(() {
          Provider.of<UserProvider>(context, listen: false).setName(data['data']['name']??'');
          Provider.of<UserProvider>(context, listen: false).setEmail(data['data']['email'] ?? '');
          Provider.of<UserProvider>(context, listen: false).setAvatar(data['data']['avatar_photo'] ?? '');
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> _fetchAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();


    setState(() {
      appVersion = packageInfo.version;
    });
  }

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
        route: '/app_settings'
      ),
      SideMenuTileModel(
        title: 'O aplikacji',
        icon: Icons.info,
        route: '/about'
      ),
    ];

    final colors = ThemeColors.of(context);
    user = Provider.of<UserProvider>(context);
    userSet = Provider.of<UserProvider>(context, listen: false);

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
                      backgroundImage: user.avatarUrl.isNotEmpty
                        ? NetworkImage(user.avatarUrl)
                        : const AssetImage('assets/images/logo.png'),                     ),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: colors['textPrimary']
                          ),
                        ),
                        Text(
                          user.email,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'wersja: $appVersion',
                  style: TextStyle(
                    color: colors['textSecondary']
                  )
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  onPressed: () {
                    Provider.of<ThemeDataProvider>(context, listen: false).switchTheme();
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Provider.of<ThemeDataProvider>(context).getThemeIcon(),
                    size: 48.0,
                    color: colors['textPrimary'],
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
