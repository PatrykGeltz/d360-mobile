import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mariner/routes/app_router.dart';

import 'member_detail.dart';

class Member extends StatelessWidget {
  const Member({
    super.key,
    required this.id,
    required this.name,
    this.pesel = '* Nie podano *',
    this.email = '* Nie podano *',
    this.phone = '* Nie podano *',
    this.city = '* Nie podano *',
    this.address = '* Nie podano *',
    this.date_of_approval = '',
    this.register_status = '',
    required this.onDelete,
  });

  final String name;
  final String pesel;
  final String email;
  final String id;
  final String phone;
  final String city;
  final String address;
  final String date_of_approval;
  final String register_status;
  final VoidCallback onDelete; // Callback do wywołania po usunięciu

  Future<void> _deleteMember(BuildContext context) async {
    var url = 'https://acme-dev.d360.pl/api/v1/members/$id';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Błąd autoryzacji')),
      );
      return;
    }

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Członek usunięty pomyślnie')),
        );
        onDelete(); // Wywołaj callback do odświeżenia listy po usunięciu
      } else {
        throw Exception('Nie udało się usunąć członka');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final router = AutoRouter.of(context);
        router.push(MembersMemberRoute(
          id: id,
          name: name,
          pesel: pesel,
          email: email,
          phone: phone,
          address: address,
          city: city,
          registerStatus: register_status,
          dateOfApproval: date_of_approval
        ));
      },
      child: Row(
        children: [
          const Icon(Icons.person),
          const SizedBox(width: 8.0),
          Expanded(child: Text(name)),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => MemberDetail(
                  id: id,
                  name: name,
                  pesel: pesel,
                  email: email,
                  phone: phone,
                  address: address,
                  city: city,
                  register_status: register_status,
                  date_of_approval: date_of_approval
                ),
              );
            },
            icon: const Icon(Icons.more_horiz),
          ),
          IconButton(
            onPressed: () {
              _deleteMember(context); // Wywołanie funkcji usuwania
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
