import 'package:flutter/material.dart';
import 'package:mariner/components/members_components/user.dart';
import 'package:mariner/theme/colors.dart';

class UsersPage extends StatelessWidget {

  static const String id = '/members/users';

  const UsersPage({super.key});



  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Użytkownicy') ,),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            User(name: 'ra2nek' ),
            Divider(color: colors['special'],),
            User(name: 'Andrzej')
        ],
      ),
      )
    );
  }
}
