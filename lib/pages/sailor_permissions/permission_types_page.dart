import 'package:flutter/material.dart';

class SailorPermissionsPermissionTypesPage extends StatelessWidget {
  static const String id = '/sailor_permissions/types';
  
  const SailorPermissionsPermissionTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rodzaje patentów')
      ),
    );
  }
}
