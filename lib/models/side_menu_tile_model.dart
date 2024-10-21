import 'package:flutter/material.dart';

class SideMenuTileModel {
  const SideMenuTileModel({required this.title, required this.icon, this.route, this.returnRoute = false});

  final String title;
  final IconData icon;
  final String? route;
  final bool returnRoute;

  get hasRoute => route != null;

  executeWith(BuildContext context) {
    if (returnRoute) {
      Navigator.pop(context);
    } else if (hasRoute) {
      Navigator.pushNamed(context, route!);
    }
  }
}