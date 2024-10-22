import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/components/members/join_requests_list.dart';
// import 'package:mariner/components/members/user_wants_to_join.dart';

import 'package:mariner/models/user_model.dart';

@RoutePage()
class MembersJoinRequestsPage extends StatelessWidget {
  const MembersJoinRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<UserModel> users = [
      UserModel(
        nick: 'ra2nek',
        pesel: '20337472325',
        phone: '+48 333 333 333',
        email: 'ra4nek@gmail.com',
      ),
      UserModel(
        nick: 'Andrzej',
        pesel: '24221432531',
        phone: '+55 242 422 222',
      )
    ];

    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: JoinRequestsList(users: users),
      // child: Column(
      //   children: [
      //     SizedBox(height: 20.0,),
      //     User(name: 'ra8nek', email: '+48 333 33 333',)
      //   ],
      // ),
    );
  }
}
