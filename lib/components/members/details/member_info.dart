import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/lists/header_title.dart';

class MemberInfo extends StatelessWidget {
  const MemberInfo({
    super.key,
    required this.name,
    required this.dateOfApproval,
    required this.pesel,
    required this.email,
    required this.phone,
    required this.address
  });

  final String name;
  final String dateOfApproval;
  final String pesel;
  final String email;
  final String phone;
  final String address;


  final double margin = 16.0;
  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    return Column(
      children: [
        const HeaderTitle(title: 'Informacje'),
        SizedBox(height: margin,),
        Text(name, style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700
        ),),

        Text('Członek od: $dateOfApproval', style: TextStyle(color: colors['textSecondary']),),

        Row(
          children: [
            const Text( 'PESEL: ', style: TextStyle(fontWeight: FontWeight.w700), ),
            Text(pesel)
          ],
        ),
        SizedBox(height: margin / 2,),
        Row(
          children: [
            const Icon(Icons.mail),
            SizedBox(width: margin,),
            Text(email)
          ],
        ),
        SizedBox(height: margin / 2,),
        Row(
          children: [
            const Icon(Icons.phone),
            SizedBox(width: margin,),
            Text(phone)
          ],
        ),
        SizedBox(height: margin / 2,),
        Row(
          children: [
            const Icon(Icons.location_on_sharp),
            const SizedBox(width: 8.0,),
            Text(address)
          ],
        )

      ],
    );
  }
}
