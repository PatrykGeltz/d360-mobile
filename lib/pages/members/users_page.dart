import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mariner/components/members/user.dart';
import 'package:mariner/theme/colors.dart';

@RoutePage()
class UsersPage extends StatelessWidget {

  static const String id = '/members/users';

  const UsersPage({super.key});



  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Użytkownicy'),
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const User(name: 'ra2nek', phone: '+48 333 33 333', pesel: '20337472', email: 'ra4nek@gmail.com',),
            Divider(color: colors['special'],),
            const User(name: 'Andrzej', phone: '+55 242 422 22', pesel: '24221432',)
          ],
        ),
      )
    );
  }
}
