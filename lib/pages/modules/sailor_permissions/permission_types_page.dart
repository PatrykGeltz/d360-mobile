import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SailorPermissionsPermissionTypesPage extends StatelessWidget {
  const SailorPermissionsPermissionTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Rodzaje patentów')
    );
  }
}

class SailorPermission extends StatelessWidget {
  const SailorPermission({super.key, required this.name, required this.type, this.typeColor});

  final String name;
  final String type;
  final Color? typeColor;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

