import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SailorPermissionsPermissionTypesPage extends StatelessWidget {
  static const String id = '/sailor_permissions/types';
  
  const SailorPermissionsPermissionTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Rodzaje patentów')
    );
  }
}
