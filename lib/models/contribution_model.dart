class ContributionModel {
  final int id;
  final String name;
  final double billingAmount;
  final bool isForJunior;
  final String startDate;
  final bool isActive;
  final bool isAdditional;

  ContributionModel({
    required this.id,
    required this.name,
    required this.billingAmount,
    required this.isForJunior,
    required this.startDate,
    required this.isActive,
    required this.isAdditional,
  });

  factory ContributionModel.fromJson(Map<String, dynamic> json) {
    return ContributionModel(
      id: json['id'],
      name: json['name'],
      billingAmount: double.parse(json['billing_amount']),
      isForJunior: json['for_junior'],
      startDate: json['start_date'],
      isActive: json['is_active'],
      isAdditional: json['is_additional'],
    );
  }
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
