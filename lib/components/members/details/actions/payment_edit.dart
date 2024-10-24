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
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Kwota'
                  ),
                  onChanged: (value) {},
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Metoda płatności'
                  ),
                  onChanged: (value) {},
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Data'
                  ),
                  onChanged: (value) {},
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Kwota'
                  ),
                  onChanged: (value) {},
                ),
              )
            ],
          )
        ]);
  }
}
