import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mariner/data/main_routes.dart';

class TestsitePage extends StatelessWidget {
  static const String id = 'auth/change_password';
  const TestsitePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Andrzej'),),
    );
  }
}
