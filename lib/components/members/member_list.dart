import 'package:flutter/material.dart';

import 'package:mariner/components/members/member_detail_popup.dart';
import 'package:mariner/components/module/popup_alert.dart';

import 'package:mariner/models/user_model.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key, required this.users, this.onDelete});

  final List<UserModel> users;
  final Function(int)? onDelete;

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
                    builder: (context) => UserDetailPopup(
                      nick: user.nick,
                      pesel: user.pesel,
                      email: user.email,
                      phone: user.phone,
                    )
                  );
                },
                icon: const Icon(Icons.more_horiz)
            ),
            IconButton(
                onPressed: () {
                  if (onDelete != null) {
                    showDialog(
                      context: context,
                      builder: (context) => PopupAlert(
                        title: 'Potwierdzenie usunięcia',
                        confirmText: 'Tak',
                        cancelText: 'Nie',
                        onConfirm: () {
                          onDelete!(index);
                        },
                        children: <Widget>[
                          Text('Czy na pewno chcesz usunąć użytkownika o nazwie "${user.nick}"?')
                        ],
                      )
                    );
                  }
                },
                icon: const Icon(Icons.delete)
            ),
          ],
        );
      },
    );
  }
}
