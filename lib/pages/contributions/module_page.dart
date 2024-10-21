import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../module_page.dart';

@RoutePage()
class ContributionsPage extends StatelessWidget {
  const ContributionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePage();
  }
}
