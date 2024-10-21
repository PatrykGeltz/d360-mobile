import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/pages/module_menu_page.dart';

@RoutePage()
class MembersMenuPage extends StatelessWidget {
  const MembersMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final route = RouteData.of(context).parent!.path;

    return ModuleMenuPage(route: route);
  }
}
