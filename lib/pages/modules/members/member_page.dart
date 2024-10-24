import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mariner/theme/colors.dart';

// Components
import 'package:mariner/components/members/details/member_info.dart';
import 'package:mariner/components/members/details/member_balance.dart';
import 'package:mariner/components/members/details/member_donations.dart';
import 'package:mariner/components/members/details/member_payment.dart';
import 'package:mariner/components/members/details/member_permissions.dart';

// Components for testing
import 'package:mariner/components/members/details/license.dart';
import 'package:mariner/components/members/details/payment.dart';

@RoutePage()
class MembersMemberPage extends StatelessWidget {
  const MembersMemberPage({
    super.key,
    required this.id,
    required this.name,
    this.pesel = '* Nie podano *',
    this.email = '* Nie podano *',
    this.phone = '* Nie podano *',
    this.city = '* Nie podano *',
    this.address = '* Nie podano *',
    this.dateOfApproval = '',
    this.registerStatus = '',
  });

  final String? name;
  final String? pesel;
  final String? email;
  final String? id;
  final String? phone;
  final String? city;
  final String? address;
  final String? dateOfApproval;
  final String? registerStatus;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          MemberInfo(
              name: name!,
              dateOfApproval: dateOfApproval!,
              pesel: pesel!, email: email!, phone: phone!, address: address!
          ),

          Divider(color: colors['special'], height: 32.0,),

          const MemberBalance(balance: 16.0, donated: 32.0,),

          Divider(color: colors['special'], height: 32.0,),

          const MemberPermissions(permissions: [
            License(name: 'Coś tam tam', licenseNumber: '125215', obtainingDate: '24-12-2022'),
            License(name: 'Coś tam innego', licenseNumber: '253616', obtainingDate: '19-6-2020')
          ]),

          Divider(color: colors['special'], height: 32.0,),

          const MemberDonations(donations: [
            Payment(amount: 32.32, paymentMethod: 'paypal', date: '24-24-24', status: 'approved',),
            Payment(amount: 52.33)
          ]),

          Divider(color: colors['special'], height: 32.0,),

          const MemberPayment(payments: [
            Payment(amount: 126.23, paymentMethod: 'Steam gift card', date: '12-02-2021', status: 'declined',),
            Payment(amount: 12246.23, paymentMethod: 'Przelew', date: '06-02-2021', status: 'accepted',)
          ])

        ],
      ),
    );
  }
}
