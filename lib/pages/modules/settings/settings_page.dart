import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  static const String id = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ustawienia')
      ),
      body: const Center(child: Text('Ustawienia')),
    );
  }
}