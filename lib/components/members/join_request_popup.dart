import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';

class JoinRequestPopup extends StatelessWidget {
  const JoinRequestPopup({super.key, required this.nick, this.pesel, this.email, this.phone, this.onAccept, this.onReject});

  final String nick;
  final String? pesel;
  final String? email;
  final String? phone;
  final Function()? onAccept;
  final Function()? onReject;

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
      title: 'Prośba dołączenia',
      confirmText: 'Akceptuj',
      cancelText: 'Odrzuć',
      onConfirm: onAccept != null ? () => onAccept!() : null,
      onCancel: onReject != null ? () => onReject!() : null,
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
