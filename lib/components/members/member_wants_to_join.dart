import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'member_detail.dart';

class Member extends StatelessWidget {
  Member({
    super.key,
    required this.id,
    required this.name,
    this.pesel = '* Nie podano *',
    this.email = '* Nie podano *',
    this.phone = '* Nie podano *',
    this.city = '* Nie podano *',
    this.address = '* Nie podano *',
    this.onChange = false
  });

  final String name;
  final String pesel;
  final String email;
  final String phone;
  var  onChange;
  final String id;
  final String city;
  final String address;
  Future<void> _deleteMember(BuildContext context, String id) async {
    var url = 'https://acme-dev.d360.pl/api/v1/register-statuses/$id';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      // Jeśli token nie jest dostępny
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Błąd autoryzacji')),
      );
      return;
    }

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'member_id': id,
          'status_id': 3, // Zmiana statusu na 3
        }),
      );

      if (response.statusCode == 202) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Członek usunięty pomyślnie')),
        );
        
        if(onChange!=false) onChange();
      } else {
        if(onChange!=false) onChange();
        throw Exception('Nie udało się usunąć członka');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd: ${e.toString()}')),
      );
    }
  }

  Future<void> _acceptMember(BuildContext context, String id) async {
    var url = 'https://acme-dev.d360.pl/api/v1/register-statuses/$id';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      // Jeśli token nie jest dostępny
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Błąd autoryzacji')),
      );
      return;
    }

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'member_id': id,
          'status_id': 2, 
        }),
      );

      if (response.statusCode == 202) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Członek zaakceptowany pomyślnie')),
        );
        if(onChange!=false) onChange();
        
      } else {
        throw Exception('Nie udało się zaakceptować członka');
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
          ),
        );
      },
      child: Row(
        children: [
          const Icon(Icons.person),
          const SizedBox(width: 10.0),
          Expanded(child: Text(name)),

          IconButton(
            onPressed: () {
              _acceptMember(context, id);
            },
            icon: const Icon(Icons.done),
          ),

          IconButton(
            onPressed: () {
              _deleteMember(context, id);  // Wywołanie funkcji usuwania
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
