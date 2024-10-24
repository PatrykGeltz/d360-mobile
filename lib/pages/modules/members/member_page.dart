import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

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
    return const Placeholder();
  }
}
