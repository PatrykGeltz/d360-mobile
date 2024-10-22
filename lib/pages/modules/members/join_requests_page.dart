import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mariner/components/members/user_wants_to_join.dart';

@RoutePage()
class MembersJoinRequestsPage extends StatelessWidget {
  const MembersJoinRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 20.0,),
          User(name: 'ra8nek', email: '+48 333 33 333',)
        ],
      ),
    );
  }
}
