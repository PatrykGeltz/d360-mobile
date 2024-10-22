import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zmień hasło'),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Input(label: 'stare hasło'),
            Input(label: 'nowe hasło'),
            Input(label: 'powtórz nowe hasło'),
            const SizedBox(height: 16.0,),
            ElevatedButton(onPressed: (){
              final router = AutoRouter.of(context);
              router.back();
            }, child: const Text('Zmień hasło')),
          ],
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({super.key, required this.label, this.controller});

  final String label;
  final controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
          labelText: label
      ),
    );
  }
}

