import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';

import 'theme/theme.dart';

import 'package:mariner/routes/app_router.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider( // create the provider
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeDataProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: MainApp(),
  ),);
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mariner',

      routerConfig: _appRouter.config(),

      theme: Provider.of<ThemeDataProvider>(context).getThemeData(),
      darkTheme: Provider.of<ThemeDataProvider>(context).getThemeData(reverse: true),
    );
  }
}