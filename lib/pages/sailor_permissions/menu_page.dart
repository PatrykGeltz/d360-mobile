import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../module_menu_page.dart';

@RoutePage()
class PermissionsMenuPage extends StatelessWidget {
  const PermissionsMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final route = RouteData.of(context).parent!.path;

    return ModuleMenuPage(route: route);
  }
}
