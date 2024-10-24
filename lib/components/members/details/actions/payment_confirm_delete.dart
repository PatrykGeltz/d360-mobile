import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/module/danger_button.dart';

class PaymentConfirmDelete extends StatelessWidget {
  const PaymentConfirmDelete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
        title: 'Usunąć tą płatność?',
        children: const [
          Text('Wszystkie dane związane z tą płatnością zostaną usunięte')
        ],

        actionsBuilder: (context){
          return [
            OutlinedButton(onPressed: (){
              PopupAlert.close(context);
            }, child: const Text('Anuluj')),
            DangerButton(
              title: 'Usuń',
              onPressed: (){
                PopupAlert.close(context);
              },
            )
          ];
        });
  }
}
