import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/lists/header_title.dart';

class MemberBalance extends StatelessWidget {
  const MemberBalance({
    super.key,
    required this.balance,
    this.donated = 0.00
  });

  final double balance;
  final double donated;

  final double margin = 16.0;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return Column(
      children: [
        const HeaderTitle(title: 'Balans'),
        SizedBox(height: margin),
        Text('$balance zł', style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 32
        ),),

        Text('Suma dotacji: $donated zł', style: TextStyle(color: colors['textSecondary']),),

      ],
    );
  }
}
