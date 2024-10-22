import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key, required this.name, this.pesel, this.email, this.phone});

  final String name;
  final String? pesel;
  final String? email;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return AlertDialog(
      backgroundColor: colors['background'],
      title: const Text('Szczegóły'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Nick: $name'),
            const SizedBox(height: 8.0),
            Text('PESEL: $pesel'),
            const SizedBox(height: 8.0),
            Text('E-mail: $email'),
            const SizedBox(height: 8.0),
            Text('Nr tel.: $phone'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Zamknij'),
        ),
      ]
    );
  }
}
