import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/models/contribution_model.dart';

class ContributionDetailPopup extends StatelessWidget {
  const ContributionDetailPopup({super.key, required this.contribution, this.onDelete, this.onEdit});

  final ContributionModel contribution;
  final Function()? onDelete;
  final Function()? onEdit;

  String _getCostString(double cost) {
    return cost.toStringAsFixed(2).replaceFirst('.', ',');
  }

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
      title: 'Szczegóły składki',
      actionsBuilder: (context) => [
        ElevatedButton(
            onPressed: () {
              PopupAlert.close(context);

              if (onDelete != null) onDelete!();
            },
            child: const Text('Usuń')
        ),
        ElevatedButton(
          onPressed: () {
            PopupAlert.close(context);

            if (onEdit != null) onEdit!();
          },
          child: const Text('Edytuj')
        ),
      ],
      children: <Widget>[
        Text('Nazwa: ${contribution.name}'),
        const SizedBox(height: 4.0),
        Text('Kwota: ${_getCostString(contribution.billingAmount)} zł'),
        const SizedBox(height: 4.0),
        Text('Dla juniora: ${contribution.isForJunior ? 'Tak' : 'Nie'}'),
        const SizedBox(height: 4.0),
        Text('Data rozpoczęcia: ${contribution.startDate}'),
        const SizedBox(height: 4.0),
        Text('Aktywna: ${contribution.isActive ? 'Tak' : 'Nie'}'),
        const SizedBox(height: 4.0),
        Text('Dodatkowa: ${contribution.isAdditional ? 'Tak' : 'Nie'}'),
      ],
    );
  }
}
