import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String id = '/app/settings';

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ustawienia aplikacji'),),
    );
  }
}
