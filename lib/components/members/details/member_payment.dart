import 'package:flutter/material.dart';

import 'package:mariner/components/members/details/payment.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/lists/header_title.dart';

class MemberPayment extends StatelessWidget {
  const MemberPayment({
    super.key,
    required this.payments,
  });

  final List<Payment> payments;
  
  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    return Column(
      children: [
        const HeaderTitle(title: 'Lista wpłat'),
        const SizedBox(height: 16.0,),

        if(payments.isEmpty) Text('Brak wpłat', style: TextStyle(color: colors['textSecondary']))
        else ...payments

      ],
    );
  }
}
