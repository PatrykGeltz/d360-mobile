import 'package:flutter/material.dart';
import 'package:mariner/components/members/details/actions/license_detail.dart';

class License extends StatelessWidget {
  const License({
    super.key,
    required this.name,
    required this.licenseNumber,
    required this.obtainingDate,
    // required this.deleteLicense
  });

  final String name;
  final String licenseNumber;
  final String obtainingDate;
  // final deleteLicense;

  final double margin = 16.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (context) {
            return LicenseDetail(name: name, licenseNumber: licenseNumber, obtainingDate: obtainingDate);
          });
      },
      child: Row(
        children: [
          const Icon(Icons.badge),
          SizedBox(
            width: margin,
            height: margin * 2.5,
          ),
          Expanded(child: Text(name)),
        ],
      ),
    );
  }
}
