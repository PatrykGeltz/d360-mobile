import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ContributionsContributionsPage extends StatelessWidget {
  static const id = '/contributions/contributions';
  const ContributionsContributionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Składki'));
  }
}