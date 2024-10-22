import 'package:flutter/material.dart';

import 'member_detail.dart';

class Member extends StatelessWidget {
  const Member({super.key, required this.id, required this.name, this.pesel = '* Nie podano *', this.email = '* Nie podano *', this.phone = '* Nie podano *',this.city = '* Nie podano *',this.address = '* Nie podano *',});

  final String name;
  final String pesel;
  final String email;
  final String id;
  final String phone;
  final String city;
  final String address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Pressed user: $name');
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
                builder: (BuildContext context) => MemberDetail(id:id,name: name, pesel: pesel, email: email, phone: phone, address: address, city: city,)
              );
            },
            icon: const Icon(Icons.more_horiz)
          ),
          IconButton(
            onPressed: () {
              print('delete ');
            },
            icon: const Icon(Icons.delete)
          )
        ],
      ),
    );
  }
}
