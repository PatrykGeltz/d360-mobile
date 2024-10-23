import 'dart:developer' as console;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:mariner/components/contributions/contributions_list.dart';

import 'package:mariner/models/contribution_model.dart';

@RoutePage()
class ContributionsContributionsPage extends StatelessWidget {
  const ContributionsContributionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<ContributionModel> contributions = [
      ContributionModel(
        id: 1,
        name: 'Składka 1',
        billingAmount: 123.50,
        isForJunior: false,
        startDate: '01.01.2024',
        isActive: true,
        isAdditional: false
      ),
      ContributionModel(
        id: 3,
        name: 'Składka 2',
        billingAmount: 34.00,
        isForJunior: false,
        startDate: '01.05.2025',
        isActive: false,
        isAdditional: true
      ),
      ContributionModel(
        id: 4,
        name: 'Składka 3',
        billingAmount: 1.01,
        isForJunior: false,
        startDate: '23.06.2026',
        isActive: false,
        isAdditional: false
      ),
      ContributionModel(
          id: 6,
          name: 'Dłuuuugaaa naaazwaaaaaaaa',
          billingAmount: 1500.00,
          isForJunior: true,
          startDate: '12.07.2023',
          isActive: true,
          isAdditional: false
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ContributionsList(
        contributions: contributions,
        onDelete: (index) {
          final contribution = contributions[index];

          console.log('Delete contribution "${contribution.name}"');
        },
        onEdit: (index, newContribution) {
          final contribution = contributions[index];

          console.log('Edited contribution "${contribution.name}"');
        },
      )
    );
  }
}