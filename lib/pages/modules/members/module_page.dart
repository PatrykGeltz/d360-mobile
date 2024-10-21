import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/pages/module_page.dart';

@RoutePage()
class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePage();
  }
}
