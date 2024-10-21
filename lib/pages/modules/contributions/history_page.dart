import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ContributionsHistoryPage extends StatelessWidget {
  static const String id = '/contributions/history';
  
  const ContributionsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Historia składek')
    );
  }
}
