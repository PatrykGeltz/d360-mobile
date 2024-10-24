import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'payment.dart';

class MemberDonations extends StatelessWidget {
  const MemberDonations({
    super.key,
    required this.donations
  });

  final List<Payment> donations;

  final double margin = 16.0;
  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    return Column(
      children: [
        const HeaderTitle(title: 'Lista darowizn'),
        SizedBox(height: margin,),
        if(donations.isEmpty) Text('Brak darowizn', style: TextStyle(color: colors['textSecondary']))
        else ...donations
      ],
    );
  }
}
