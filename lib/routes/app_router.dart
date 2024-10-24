import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/routes/guards/auth_guard.dart';
import 'package:mariner/routes/guards/permission_guard.dart';

import 'package:mariner/pages/main_page.dart';
import 'package:mariner/pages/login_page.dart';
import 'package:mariner/pages/logout_page.dart';

import 'package:mariner/pages/module_page.dart';
import 'package:mariner/pages/module_menu_page.dart';

// Members module
import 'package:mariner/pages/modules/members/module_page.dart';
import 'package:mariner/pages/modules/members/menu_page.dart';
import 'package:mariner/pages/modules/members/members_page.dart';
import 'package:mariner/pages/modules/members/join_requests_page.dart';
import 'package:mariner/pages/modules/members/statuses_page.dart';
import 'package:mariner/pages/modules/members/roles_page.dart';
import 'package:mariner/pages/modules/members/invites_page.dart';
import 'package:mariner/pages/modules/members/member_page.dart';

// Contributions module
import 'package:mariner/pages/modules/contributions/module_page.dart';
import 'package:mariner/pages/modules/contributions/menu_page.dart';
import 'package:mariner/pages/modules/contributions/contributions_page.dart';
import 'package:mariner/pages/modules/contributions/dictionary_page.dart';
import 'package:mariner/pages/modules/contributions/history_page.dart';

// Sailor permissions module
import 'package:mariner/pages/modules/sailor_permissions/module_page.dart';
import 'package:mariner/pages/modules/sailor_permissions/menu_page.dart';
import 'package:mariner/pages/modules/sailor_permissions/permissions_page.dart';
import 'package:mariner/pages/modules/sailor_permissions/permission_types_page.dart';
import 'package:mariner/pages/modules/sailor_permissions/member_permissions_page.dart';

// Marina module
import 'package:mariner/pages/modules/marina/module_page.dart';
import 'package:mariner/pages/modules/marina/menu_page.dart';
import 'package:mariner/pages/modules/marina/lockers_page.dart';
import 'package:mariner/pages/modules/marina/parking_spaces_page.dart';

// Statuses module
import 'package:mariner/pages/modules/statuses/statuses_page.dart';

// Settings module
import 'package:mariner/pages/modules/settings/settings_page.dart';

// User profile
import 'package:mariner/pages/profile/profile_page.dart';

// Change password
import 'package:mariner/pages/profile/auth/change_password_page.dart';

// App settings
import 'package:mariner/pages/app_settings/app_settings_page.dart';

// About app
import 'package:mariner/pages/about/about_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainRoute.page,
      path: '/',
      guards: [AuthGuard()],
      initial: true,
    ),

    // Members module
    AutoRoute(
      page: MembersRoute.page,
      path: '/members',
      guards: [AuthGuard(), PermissionGuard()],
      title: (context, routeData) => 'Członkowie',
      children: [
        AutoRoute(
            page: MembersMenuRoute.page,
            path: '',
            initial: true
        ),
        AutoRoute(
            page: MembersMemberRoute.page,
            path: 'member'
        ),
        AutoRoute(
            page: MembersUsersRoute.page,
            path: 'users'
        ),
        AutoRoute(
            page: MembersJoinRequestsRoute.page,
            path: 'join_requests'
        ),
        AutoRoute(
            page: MembersStatusesRoute.page,
            path: 'statuses'
        ),
        AutoRoute(
            page: MembersRolesRoute.page,
            path: 'roles'
        ),
        AutoRoute(
            page: MembersInvitesRoute.page,
            path: 'invites'
        ),
      ]
    ),

    // Contributions module
    AutoRoute(
      page: ContributionsRoute.page,
      path: '/contributions',
      guards: [AuthGuard(), PermissionGuard()],
      title: (context, routeData) => 'Składki',
      children: [
        AutoRoute(
            page: ContributionsMenuRoute.page,
            path: '',
            initial: true
        ),
        AutoRoute(
            page: ContributionsContributionsRoute.page,
            path: 'contributions'
        ),
        AutoRoute(
            page: ContributionsHistoryRoute.page,
            path: 'history'
        ),
        AutoRoute(
            page: ContributionsDictionaryRoute.page,
            path: 'dictionary'
        ),
      ]
    ),

    // Sailor permissions module
    AutoRoute(
      page: SailorPermissionsRoute.page,
      path: '/sailor_permissions',
      guards: [AuthGuard(), PermissionGuard()],
      title: (context, routeData) => 'Uprawnienia żeglarskie',
      children: [
        AutoRoute(
            page: SailorPermissionsMenuRoute.page,
            path: '',
            initial: true
        ),
        AutoRoute(
            page: SailorPermissionsPermissionsRoute.page,
            path: 'permissions'
        ),
        AutoRoute(
            page: SailorPermissionsPermissionTypesRoute.page,
            path: 'permission_types'
        ),
        AutoRoute(
            page: SailorPermissionsMemberPermissionsRoute.page,
            path: 'member_permissions'
        ),
      ]
    ),

    // Marina module
    AutoRoute(
      page: MarinaRoute.page,
      path: '/marina',
      guards: [AuthGuard(), PermissionGuard()],
      title: (context, routeData) => 'Marina',
      children: [
        AutoRoute(
            page: MarinaMenuRoute.page,
            path: '',
            initial: true
        ),
        AutoRoute(
            page: MarinaLockersRoute.page,
            path: 'lockers'
        ),
        AutoRoute(
            page: MarinaParkingSpacesRoute.page,
            path: 'parking_spaces'
        ),
      ]
    ),

    // Statuses module
    AutoRoute(
      page: StatusesRoute.page,
      path: '/statuses',
      guards: [AuthGuard(), PermissionGuard()],
      title: (context, routeData) => 'Statusy'
    ),

    // Statuses module
    AutoRoute(
        page: SettingsRoute.page,
        path: '/settings',
        guards: [AuthGuard(), PermissionGuard()],
        title: (context, routeData) => 'Ustawienia klubu'
    ),

    // User profile
    AutoRoute(
      page: ProfileRoute.page,
      path: '/profile',
      guards: [AuthGuard()],
      title: (context, routeData) => 'Twój profil'
    ),

    // App settings
    AutoRoute(
        page: AppSettingsRoute.page,
        path: '/app_settings',
        guards: [AuthGuard()],
        title: (context, routeData) => 'Ustawienia'
    ),

    // App settings
    AutoRoute(
        page: AboutRoute.page,
        path: '/about',
        guards: [AuthGuard()],
        title: (context, routeData) => 'O aplikacji'
    ),

    AutoRoute(
      page: ChangePasswordRoute.page,
      path: '/change_password',
      guards: [AuthGuard()],
    ),

    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),

    AutoRoute(
      page: LogoutRoute.page,
      path: '/logout',
    ),
  ];
}