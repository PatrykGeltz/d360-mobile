import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';

class LicenseEdit extends StatelessWidget {
  const LicenseEdit({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
        title: 'Edycja - $name',
        actionsBuilder: (context) {
          return <Widget>[
            OutlinedButton(
                onPressed: () {
                  PopupAlert.close(context);
                },
                child:
                const Text('anuluj')),
            ElevatedButton(
                onPressed: () {
                  PopupAlert.close(context);
                },
                child: const Text('zapisz'))
          ];
        },
        children: <Widget>[
          Row(
            children: [
              const Text('Nazwa: '),
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('Nr licencji: '),
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('Data wydania: '),
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                ),
              )
            ],
          )
        ]);
  }
}
