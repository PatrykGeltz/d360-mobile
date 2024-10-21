import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SideMenuTileModel {
  const SideMenuTileModel({required this.title, required this.icon, this.route, this.returnRoute = false});

  final String title;
  final IconData icon;
  final String? route;
  final bool returnRoute;

  get hasRoute => route != null;

  executeWith(BuildContext context) {
    final router = AutoRouter.of(context);

    if (returnRoute) {
      router.back();
    } else if (hasRoute) {
      router.pushNamed(route!);
    }
  }
}