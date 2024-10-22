import 'dart:developer' as console;

import 'package:flutter/material.dart';

import 'package:mariner/components/members/member_detail_popup.dart';

import 'package:mariner/models/user_model.dart';

class JoinRequestsList extends StatelessWidget {
  const JoinRequestsList({super.key, required this.users});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return UserDetailPopup(
                    nick: user.nick,
                    pesel: user.pesel,
                    email: user.email,
                    phone: user.phone,
                  );
                }
            );
          },
          child: Row(
            children: <Widget>[
              const Icon(Icons.person),
              const SizedBox(width: 8.0),
              Expanded(child: Text(user.nick)),
              IconButton(
                onPressed: () {
                  console.log('User "${user.nick}" accepted');
                },
                icon: const Icon(Icons.check)
              ),
              IconButton(
                  onPressed: () {
                    console.log('User "${user.nick}" rejected');
                  },
                  icon: const Icon(Icons.close)
              ),
            ],
          ),
        );
      },
    );
  }
}
