import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/module/danger_button.dart';

class LicenseConfirmDelete extends StatelessWidget {
  const LicenseConfirmDelete({
    super.key,
    required this.name
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
        title: 'Usunąć licencje - $name',
        children: const [
          Text('Czy jesteś pewien że chcesz usunąć tą licencję?')
        ],

        actionsBuilder: (context){
          return [
            OutlinedButton(onPressed: (){
              PopupAlert.close(context);
            }, child: const Text('Anuluj')),
            DangerButton(
              title: 'Usuń',
              onPressed: (){},
            )
          ];
        });
  }
}
