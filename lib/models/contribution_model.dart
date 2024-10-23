class ContributionModel {
  const ContributionModel({
    this.id = 0,
    required this.name,
    this.billingAmount = 0.0,
    this.isForJunior = false,
    this.startDate = '',
    this.isActive = true,
    this.isAdditional = false
  });

  final int id;
  final String name;
  final double billingAmount;
  final bool isForJunior;
  final String startDate;
  final bool isActive;
  final bool isAdditional;
}