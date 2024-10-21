import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MarinaParkingSpacesPage extends StatelessWidget {
  static const String id = '/marina/parking_spaces';

  const MarinaParkingSpacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Miejsca postojowe'),),
      body: const Center(child: Text('Miejsca postojowe'),),
    );
  }
}
