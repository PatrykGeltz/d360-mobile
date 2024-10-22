import 'dart:developer' as console;

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/components/members/users_list.dart';

import 'package:mariner/models/user_model.dart';

@RoutePage()
class MembersUsersPage extends StatelessWidget {
  const MembersUsersPage({super.key});

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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: UsersList(
        users: users,
        onDelete: (index) {
          console.log('Delete user: ${users[index].nick}');
        }
      )
    );
  }
}
