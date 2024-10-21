import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';

import 'theme/theme.dart';

import 'package:mariner/routes/app_router.dart';

// import 'pages/main_page.dart';
// import 'pages/login_page.dart';
// import 'pages/subsections_page.dart';
//
// // Importing contributions pages
// import 'pages/contributions/module_page.dart' as Contributions;
// import 'pages/contributions/history_page.dart' as Contributions;
// import 'pages/contributions/dictionary_page.dart' as Contributions;
//
// // Importing marina pages
// import 'pages/marina/parking_spaces_page.dart' as Marina;
// import 'pages/marina/lockers_page.dart' as Marina;
//
// // Importing members pages
// import 'pages/members/users_page.dart' as Members;
// import 'pages/members/invites_page.dart' as Members;
// import 'pages/members/roles_page.dart' as Members;
// import 'pages/members/statuses_page.dart' as Members;
// import 'pages/members/join_requests_page.dart' as Members;
//
// // Importing sailor permissions pages
// import 'pages/sailor_permissions/permissions_page.dart' as Permissions;
// import 'pages/sailor_permissions/permission_types_page.dart' as Permissions;
//
// // Importing settings pages
// import 'pages/settings/settings_page.dart' as Settings;
//
// // Importing statuses pages
// import 'pages/statuses/statuses_page.dart' as Statuses;

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

      // home: FutureBuilder<bool>(
      //   future: isLoggedIn(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return const Center(child: Text('Błąd podczas sprawdzania logowania.'));
      //     } else {
      //
      //       return snapshot.data! ? const MainPage() : const LoginPage();
      //     }
      //   },
      // ),
      //
      // routes: {
      //   MainPage.id: (context) => const MainPage(),
      //   LoginPage.id: (context) => const LoginPage(),
      //   SectionsPage.id: (context) => SectionsPage(route: ModalRoute.of(context)!.settings.arguments as String),
      //
      //   // Contributions module routes
      //   Contributions.ContributionsPage.id: (context) => const Contributions.ContributionsPage(),
      //   Contributions.DictionaryPage.id: (context) => const Contributions.DictionaryPage(),
      //   Contributions.HistoryPage.id: (context) => const Contributions.HistoryPage(),
      //
      //   // Marina module routes
      //   Marina.LockersPage.id: (context) => const Marina.LockersPage(),
      //   Marina.ParkingSpacesPage.id: (context) => const Marina.ParkingSpacesPage(),
      //
      //   // Members module routes
      //   Members.UsersPage.id: (context) => const Members.UsersPage(),
      //   Members.InvitesPage.id: (context) => const Members.InvitesPage(),
      //   Members.RolesPage.id: (context) => const Members.RolesPage(),
      //   Members.StatusesPage.id: (context) => const Members.StatusesPage(),
      //   Members.WantsToJoinPage.id: (context) => const Members.WantsToJoinPage(),
      //
      //   // Sailor permissions module routes
      //   Permissions.SailorPermissionsPage.id: (context) => const Permissions.SailorPermissionsPage(),
      //   Permissions.SailorPermissionsTypesPage.id: (context) => const Permissions.SailorPermissionsTypesPage(),
      //
      //   // Settings module routes
      //   Settings.SettingsPage.id: (context) => const Settings.SettingsPage(),
      //
      //   // Statuses module routes
      //   Statuses.StatusesPage.id: (context) => const Statuses.StatusesPage(),
      // },

      theme: Provider.of<ThemeDataProvider>(context).getThemeData(),
      darkTheme: Provider.of<ThemeDataProvider>(context).getThemeData(reverse: true),
    );
  }
}