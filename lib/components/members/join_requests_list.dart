import 'dart:developer' as console;

import 'package:flutter/material.dart';

import 'package:mariner/components/members/join_request_popup.dart';

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

        return Row(
          children: <Widget>[
            const Icon(Icons.person),
            const SizedBox(width: 8.0),
            Expanded(child: Text(user.nick)),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return JoinRequestPopup(
                        nick: user.nick,
                        pesel: user.pesel,
                        email: user.email,
                        phone: user.phone,
                        onAccept: () {
                          console.log('User "${user.nick}" is accepted');
                        },
                        onReject: () {
                          console.log('User "${user.nick}" is rejected');
                        },
                      );
                    }
                  );
                },
                icon: const Icon(Icons.more_vert)
            ),
          ],
        );
      },
    );
  }
}
