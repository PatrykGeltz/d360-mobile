import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/components/members/user.dart';

@RoutePage()
class MembersInvitesPage extends StatelessWidget {
  static const String id = '/members/invites';

  const MembersInvitesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zaproszenia'),),
      body: const Column(

      ),
    );
  }
}