import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SailorPermissionsPermissionTypesPage extends StatelessWidget {
  const SailorPermissionsPermissionTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('Rodzaj')),
              Text('Opcje'),
            ],
          )
        ],
      ),
    );
  }
}

class SailorPermissionType extends StatelessWidget {
  const SailorPermissionType({super.key, required this.name, this.typeColor});

  final String name;
  final Color? typeColor;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

