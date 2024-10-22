import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/components/members/member.dart';

@RoutePage()
class MembersUsersPage extends StatelessWidget {
  const MembersUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Divider(color: colors['special'],),
          
        ],
      ),
    );
  }
}
