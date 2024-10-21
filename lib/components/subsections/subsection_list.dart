import 'package:flutter/material.dart';
import 'subsection_button.dart';

// Importing contributions pages
import 'package:mariner/pages/modules/contributions/contributions_page.dart' as Contributions;
import 'package:mariner/pages/modules/contributions/history_page.dart' as Contributions;
import 'package:mariner/pages/modules/contributions/dictionary_page.dart' as Contributions;

// Importing marina pages
import 'package:mariner/pages/modules/marina/parking_spaces_page.dart' as Marina;
import 'package:mariner/pages/modules/marina/lockers_page.dart' as Marina;

// Importing members pages
import 'package:mariner/pages/modules/members/users_page.dart' as Members;
import 'package:mariner/pages/modules/members/invites_page.dart' as Members;
import 'package:mariner/pages/modules/members/roles_page.dart' as Members;
import 'package:mariner/pages/modules/members/statuses_page.dart' as Members;
import 'package:mariner/pages/modules/members/join_requests_page.dart' as Members;

// Importing sailor permissions pages
import 'package:mariner/pages/modules/sailor_permissions/permissions_page.dart' as Permissions;
import 'package:mariner/pages/modules/sailor_permissions/permission_types_page.dart' as Permissions;

const Map < String, List > kSubsections = {
  '/members': <Widget>[
    SubsectionButton(icon: Icons.groups, title: 'Użytkownicy', route: Members.MembersUsersPage.id,),
    SubsectionButton(icon: Icons.mail, title: 'Zaproszenia', route: Members.MembersInvitesPage.id,),
    SubsectionButton(title: 'Prośby o dołączenie', icon: Icons.insert_invitation, route: Members.MembersJoinRequestsPage.id),
    SubsectionButton(icon: Icons.perm_contact_calendar_rounded, title: 'Role', route: Members.MembersRolesPage.id,),
    SubsectionButton(icon: Icons.start, title: 'Statusy', route: Members.MembersStatusesPage.id,)
  ],
  '/contributions': <Widget>[
    SubsectionButton(title: 'Skladki', icon: Icons.monetization_on, route: Contributions.ContributionsContributionsPage.id,),
    SubsectionButton(title: 'Historia składek', icon: Icons.history, route: Contributions.ContributionsHistoryPage.id,),
    SubsectionButton(title: 'Slownik opłat', icon: Icons.pending_actions, route: Contributions.ContributionsDictionaryPage.id,)
  ],
  '/sailor_permissions': <Widget>[
    SubsectionButton(title: 'Patenty', icon: Icons.badge, route: Permissions.SailorPermissionsPermissionsPage.id,),
    SubsectionButton(title: 'Rodzaje patentow', icon: Icons.document_scanner, route: Permissions.SailorPermissionsPermissionTypesPage.id,)
  ],
  '/marina': <Widget>[
    SubsectionButton(title: 'Miejsca postojowe', icon: Icons.anchor, route: Marina.MarinaParkingSpacesPage.id,),
    SubsectionButton(title: 'Szafki', icon: Icons.lock_open, route: Marina.MarinaLockersPage.id,)
  ]
};