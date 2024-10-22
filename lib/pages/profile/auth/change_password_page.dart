import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChangePasswordPage extends StatelessWidget {
  static const String id = '/change_password';
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zmień hasło'),),
      body: const Column(
        children: [
          Input(label: 'stare hasło'),
          Input(label: 'nowe hasło'),
          Input(label: 'powtórz nowe hasło'),
        ],
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){

      },
      decoration: InputDecoration(
          labelText: label
      ),
    );
  }
}

