import 'dart:developer' as console;

import 'package:flutter/material.dart';

import 'user_detail.dart';

class User extends StatelessWidget {
  const User({super.key, required this.name, this.pesel = '* Nie podano *', this.email = '* Nie podano *', this.phone = '* Nie podano *',});

  final String name;
  final String pesel;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        console.log('Pressed user: $name');
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
                builder: (BuildContext context) => UserDetail(name: name, pesel: pesel, email: email, phone: phone)
              );
            },
            icon: const Icon(Icons.more_horiz)
          ),
          IconButton(
            onPressed: () {
              console.log('Delete user: $name');
            },
            icon: const Icon(Icons.delete)
          )
        ],
      ),
    );
  }
}
