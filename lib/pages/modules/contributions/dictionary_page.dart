import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ContributionsDictionaryPage extends StatelessWidget {
  static const String id = '/contributions/dictionary';
  
  const ContributionsDictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Słownik opłat'),),
    );
  }
}
