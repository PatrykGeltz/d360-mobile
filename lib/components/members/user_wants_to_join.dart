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
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) =>
            UserDetail(name: name, pesel: pesel, email: email, phone: phone,));
      },
      child: Row(
        children: [
          const Icon(Icons.person),
          const SizedBox(width: 10.0),
          Expanded(child: Text(name),),

          IconButton(onPressed: (){
            console.log('approve request: $name');
          }, icon: const Icon(Icons.done) ),

          IconButton(onPressed: (){
            console.log('delete request: $name');
          }, icon: const Icon(Icons.close) )
        ],
      ),
    );
  }
}
