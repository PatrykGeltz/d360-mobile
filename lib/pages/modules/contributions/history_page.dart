import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/components/contributions/contributions_history_list.dart';

import 'package:mariner/models/contribution_history_model.dart';
import 'package:mariner/models/contribution_model.dart';

@RoutePage()
class ContributionsHistoryPage extends StatelessWidget {
  const ContributionsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ContributionHistoryModel> contributions = [
      ContributionHistoryModel(
        id: 1,
        contribution: ContributionModel(
          id: 4,
          name: 'Składka 3',
          billingAmount: 1.01,
          isForJunior: false,
          startDate: '23.06.2023',
          isActive: false,
          isAdditional: false
        ),
        chargedAt: '30.09.2023',
        membersChargedCount: 3
      ),
      ContributionHistoryModel(
          id: 2,
          contribution: ContributionModel(
              id: 6,
              name: 'Składka 2',
              billingAmount: 1234.50,
              isForJunior: true,
              startDate: '23.01.2022',
              isActive: false,
              isAdditional: false
          ),
          chargedAt: '01.12.2024',
          membersChargedCount: 23
      )
    ];

    return Padding(
      padding:  const EdgeInsets.all(16.0),
      child: ContributionsHistoryList(contributions: contributions),
    );
  }
}
