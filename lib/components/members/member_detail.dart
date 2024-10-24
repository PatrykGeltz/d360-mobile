import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';

class MemberDetail extends StatelessWidget {
  const MemberDetail({super.key, required this.id, required this.name, this.pesel = '* Nie podano *', this.email = '* Nie podano *', this.phone = '* Nie podano *', this.city = '* Nie podano *', this.address = '* Nie podano *', this.date_of_approval = '* Nie podano *', this.register_status = '* Nie podano *'});

  final String name;
  final String id;
  final String pesel;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String register_status;
  final String date_of_approval;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return AlertDialog(
      backgroundColor: colors['secondary'],
        title: Text(name),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Pesel: $pesel'),
              const SizedBox(height: 5.0,),
              Text('Email: $email'),
              const SizedBox(height: 5.0,),
              Text('Nr telefonu: $phone'),
              const SizedBox(height: 5.0,),
              Text('Miasto: $city'),
              const SizedBox(height: 5.0,),
              Text('Adres: $address'),
              const SizedBox(height: 5.0,),
              Text('Data dołączenia: $date_of_approval'),
              const SizedBox(height: 5.0,),
              Text('Status członka: $register_status'),
              


            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Zamknij'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]);
  }
}
