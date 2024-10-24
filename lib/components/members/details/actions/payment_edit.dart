import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';

class PaymentEdit extends StatelessWidget {
  const PaymentEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
        title: 'Edycja dotacji',
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
              const Text('Kwota: '),
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('Metoda płatności: '),
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('Data: '),
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('Status: '),
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
