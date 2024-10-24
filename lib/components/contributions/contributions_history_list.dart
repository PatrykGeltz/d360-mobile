import 'package:flutter/material.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/components/contributions/contribution_history_detail_popup.dart';

import 'package:mariner/models/contribution_history_model.dart';

class ContributionsHistoryList extends StatelessWidget {
  const ContributionsHistoryList({super.key, required this.contributions});

  final List<ContributionHistoryModel> contributions;

  String _limitTextLength(String text, int limit) {
    if (text.length <= limit - 3) return text;

    return '${text.substring(0, limit - 3).trim()}...';
  }

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return ListView.builder(
      itemCount: contributions.length,
      itemBuilder: (context, index) {
        final contributionHistory = contributions[index];

        return Row(
          children: <Widget>[
            const SizedBox(height: 48.0), // set row height to 48 px
            Text(_limitTextLength(contributionHistory.contribution.name, 16)),
            const SizedBox(width: 8.0),
            Text(
              contributionHistory.chargedAt,
              style: TextStyle(color: colors['textSecondary']),
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.person,
              size: 16.0,
            ),
            Text(contributionHistory.membersChargedCount.toString()),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ContributionHistoryDetailPopup(
                    contributionHistory: contributionHistory,
                  )
                );
              },
              icon: const Icon(Icons.more_vert)
            )
          ],
        );
      },
    );
  }
}
