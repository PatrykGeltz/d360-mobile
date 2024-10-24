import 'package:flutter/material.dart';

import 'package:mariner/components/module/popup_alert.dart';

import 'package:mariner/models/contribution_history_model.dart';

class ContributionHistoryDetailPopup extends StatelessWidget {
  const ContributionHistoryDetailPopup({super.key, required this.contributionHistory});

  final ContributionHistoryModel contributionHistory;

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
      title: 'Szczegóły składki',
      actionsBuilder: (context) => [
        TextButton(
          onPressed: () {
            PopupAlert.close(context);
          },
          child: const Text('Zamknij'),
        )
      ],
      children: [
        Text('Nazwa: ${contributionHistory.contribution.name}'),
        const SizedBox(height: 8.0),
        Text('Junior: ${contributionHistory.contribution.isForJunior ? 'Tak' : 'Nie'}'),
        const SizedBox(height: 8.0),
        Text('Data pobrania: ${contributionHistory.chargedAt}'),
        const SizedBox(height: 8.0),
        Text('Pobrano od: ${contributionHistory.membersChargedCount} członków'),
      ],
    );
  }
}
