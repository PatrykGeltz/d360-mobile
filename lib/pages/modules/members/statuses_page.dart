import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MembersStatusesPage extends StatelessWidget {
  static const String id = '/members/statuses';
  
  const MembersStatusesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statusy'),),
    );
  }
}
