import 'package:flutter/material.dart';
import 'package:mariner/components/module/popup_alert.dart';
import 'license_edit.dart';

class LicenseDetail extends StatelessWidget {
  const LicenseDetail({
    super.key,
    required this.name,
    required this.licenseNumber,
    required this.obtainingDate,
  });

  final String name;
  final String licenseNumber;
  final String obtainingDate;

  @override
  Widget build(BuildContext context) {
    return PopupAlert(
        title: name,
        children: [
          Text('Nr licencji: $licenseNumber'),
          Text('Data wyadania: $obtainingDate')
        ],
        actionsBuilder: (context) {
          return [
            ElevatedButton(
                onPressed: () {
                  PopupAlert.close(context);
                },
                child: const Text('Usuń')),
            ElevatedButton(
                onPressed: () {
                  PopupAlert.close(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return LicenseEdit(name: name);
                      });
                },
                child: const Text('Edytuj')),
          ];
        });
  }
}
