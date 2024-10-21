import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mariner/routes/guards/auth_guard.dart';

import 'package:mariner/pages/main_page.dart';
import 'package:mariner/pages/login_page.dart';
import 'package:mariner/pages/logout_page.dart';

import 'package:mariner/pages/module_page.dart';
import 'package:mariner/pages/module_menu_page.dart';

// Members module
import 'package:mariner/pages/members/users_page.dart';
import 'package:mariner/pages/members/join_requests_page.dart';
import 'package:mariner/pages/members/statuses_page.dart';
import 'package:mariner/pages/members/roles_page.dart';
import 'package:mariner/pages/members/invites_page.dart';

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
      page: ModuleRoute.page,
      path: '/members',
      // guards: [AuthGuard()],
      title: (context, routeData) => 'Członkowie',
      children: [
        AutoRoute(
            page: ModuleMenuRoute.page,
            path: '',
            initial: true
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

    // // Contributions module
    // AutoRoute(
    //   page: ModuleRoute.page,
    //   path: '/contributions',
    //   // guards: [AuthGuard()],
    //   title: (context, routeData) => 'Składki',
    //   children: [
    //     AutoRoute(
    //         page: ModuleMenuRoute.page,
    //         path: '',
    //         initial: true
    //     ),
    //   ]
    // ),

    // // Sailor permissions module
    // AutoRoute(
    //   page: ModuleRoute.page,
    //   path: '/sailor_permissions',
    //   // guards: [AuthGuard()],
    //   title: (context, routeData) => 'Uprawnienia żeglarskie',
    //   children: [
    //     AutoRoute(
    //         page: ModuleMenuRoute.page,
    //         path: '',
    //         initial: true
    //     ),
    //   ]
    // ),

    // // Marina module
    // AutoRoute(
    //   page: ModuleRoute.page,
    //   path: '/marina',
    //   // guards: [AuthGuard()],
    //   title: (context, routeData) => 'Marina',
    //   children: [
    //     AutoRoute(
    //         page: ModuleMenuRoute.page,
    //         path: '',
    //         initial: true
    //     ),
    //   ]
    // ),

    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: LogoutRoute.page,
      path: '/logout',
    )
  ];
}