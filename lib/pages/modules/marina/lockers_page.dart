import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MarinaLockersPage extends StatelessWidget {
  static const String id = '/marina/lockers';

  const MarinaLockersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Szafki')
    );
  }
}
