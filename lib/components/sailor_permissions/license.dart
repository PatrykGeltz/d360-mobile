import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/sailor_permissions/actions/license_detail.dart';

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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.badge),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(child: Text(name)),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return LicenseDetail(name: name, licenseNumber: licenseNumber, obtainingDate: obtainingDate);
                  });
            },
            icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
