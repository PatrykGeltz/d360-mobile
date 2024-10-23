import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';

class UserDetailPopup extends StatelessWidget {
  const UserDetailPopup({super.key, required this.nick, this.pesel, this.email, this.phone});

  final String nick;
  final String? pesel;
  final String? email;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
      title: 'Szczegóły',
      actionsBuilder: (context) => [
        TextButton(
            onPressed: () {
              PopupAlert.close(context);
            },
            child: const Text('Zamknij')
        )
      ],
      children: <Widget>[
        Text('Nick: $nick'),
        const SizedBox(height: 8.0),
        Text('PESEL: ${pesel ?? 'brak'}'),
        const SizedBox(height: 8.0),
        Text('E-mail: ${email ?? 'brak'}'),
        const SizedBox(height: 8.0),
        Text('Nr tel.: ${phone ?? 'brak'}'),
      ],
    );
  }
}
