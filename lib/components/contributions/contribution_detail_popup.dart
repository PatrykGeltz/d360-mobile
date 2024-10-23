import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';

class ContributionDetailPopup extends StatelessWidget {
  const ContributionDetailPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
      title: 'Szczegóły',
      actionsBuilder: (context) => [
        TextButton(
          onPressed: () {
            PopupAlert.close(context);
          },
          child: const Text('Zamknij')
        )
      ],
      children: const <Widget>[],
    );
  }
}
