import 'package:mariner/models/contribution_model.dart';

class ContributionHistoryModel {
  const ContributionHistoryModel({
    this.id = 0,
    required this.contribution,
    this.chargedAt = '',
    this.membersChargedCount = 0
  });

  final int id;
  final ContributionModel contribution;
  final String chargedAt;
  final int membersChargedCount;
}