import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/components/members/member.dart';

@RoutePage()
class MembersInvitesPage extends StatelessWidget {
  static const String id = '/members/invites';

  const MembersInvitesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Zaproszenia')
    );
  }
}
