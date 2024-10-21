import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mariner/theme/colors.dart';
import 'package:mariner/models/side_menu_tile_model.dart';
import 'package:mariner/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String userName = '...';
  String userEmail = '...';
  String avatarUrl = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    const url = 'https://acme-dev.d360.pl/api/v1/user';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");
    try {
      final response = await http.get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        setState(() {
          userName = data['data']['name'] ?? 'No Name';
          userEmail = data['data']['email'] ?? 'No Email';
          avatarUrl = data['data']['avatar_photo'] ?? '';
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      setState(() {
        userName = '';
        userEmail = '';
      });
    }
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
                      backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: colors['textPrimary']
                          ),
                        ),
                        Text(
                          userEmail,
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
              const SizedBox(width: 8.0,)
            ],
          )
        ],
      ),
    );
  }
}
