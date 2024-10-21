import 'package:flutter/material.dart';

import 'package:mariner/models/main_route_model.dart';

const List<MainRouteModel> kMainRoutes = [
  MainRouteModel(
    title: 'Członkowie',
    icon: Icons.person,
    route: '/members'
  ),
  MainRouteModel(
    title: 'Składki',
    icon: Icons.monetization_on,
    route: '/contributions',
  ),
  MainRouteModel(
    title: 'Uprawnienia żeglarskie',
    icon: Icons.note_add,
    route: '/sailor_permissions',
  ),
  MainRouteModel(
    title: 'Marina',
    icon: Icons.waves,
    route: '/marina',
  ),
  MainRouteModel(
    title: 'Statusy',
    icon: Icons.star,
    route: '/statuses'
  ),
  MainRouteModel(
    title: 'Ustawienia klubu',
    icon: Icons.settings,
    route: '/settings'
  ),
];