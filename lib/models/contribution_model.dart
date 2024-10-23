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

  ContributionModel copyWith({
    int? id,
    String? name,
    double? billingAmount,
    bool? isForJunior,
    String? startDate,
    bool? isActive,
    bool? isAdditional
  }) {
    return ContributionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      billingAmount: billingAmount ?? this.billingAmount,
      isForJunior: isForJunior ?? this.isForJunior,
      startDate: startDate ?? this.startDate,
      isActive: isActive ?? this.isActive,
      isAdditional: isAdditional ?? this.isAdditional
    );
  }
}