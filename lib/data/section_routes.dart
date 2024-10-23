import 'package:flutter/material.dart';

import 'package:mariner/models/section_route_model.dart';

const Map<String, List<SectionRouteModel>> kSectionRoutes = {
  '/members': [
    SectionRouteModel(title: 'Użytkownicy', icon: Icons.groups, route: '/members/users'),
    SectionRouteModel(title: 'Zaproszenia', icon: Icons.mail, route: '/members/invites'),
    SectionRouteModel(title: 'Prośby o dołączenie', icon: Icons.insert_invitation, route: '/members/join_requests'),
    SectionRouteModel(title: 'Role', icon: Icons.perm_contact_calendar_rounded, route: '/members/roles'),
    SectionRouteModel(title: 'Statusy', icon: Icons.start, route: '/members/statuses')
  ],
  '/contributions': [
    SectionRouteModel(title: 'Składki', icon: Icons.monetization_on, route: '/contributions/contributions'),
    SectionRouteModel(title: 'Historia składek', icon: Icons.history, route: '/contributions/history'),
    SectionRouteModel(title: 'Słownik opłat', icon: Icons.pending_actions, route: '/contributions/dictionary')
  ],
  '/marina': [
    SectionRouteModel(title: 'Miejsca postojowe', icon: Icons.anchor, route: '/marina/parking_spaces'),
    SectionRouteModel(title: 'Szafki', icon: Icons.lock_open, route: '/marina/lockers')
  ],
  '/sailor_permissions': [
    SectionRouteModel(title: 'Patenty', icon: Icons.badge, route: '/sailor_permissions/permissions'),
    SectionRouteModel(title: 'Rodzaje patentów', icon: Icons.document_scanner, route: '/sailor_permissions/permission_types')
  ],
};