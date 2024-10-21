// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required dynamic Function() onSuccess,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onSuccess: onSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return LoginPage(
        key: args.key,
        onSuccess: args.onSuccess,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onSuccess,
  });

  final Key? key;

  final dynamic Function() onSuccess;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onSuccess: $onSuccess}';
  }
}

/// generated route for
/// [LogoutPage]
class LogoutRoute extends PageRouteInfo<void> {
  const LogoutRoute({List<PageRouteInfo>? children})
      : super(
          LogoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogoutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LogoutPage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [MembersInvitesPage]
class MembersInvitesRoute extends PageRouteInfo<void> {
  const MembersInvitesRoute({List<PageRouteInfo>? children})
      : super(
          MembersInvitesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembersInvitesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MembersInvitesPage();
    },
  );
}

/// generated route for
/// [MembersJoinRequestsPage]
class MembersJoinRequestsRoute extends PageRouteInfo<void> {
  const MembersJoinRequestsRoute({List<PageRouteInfo>? children})
      : super(
          MembersJoinRequestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembersJoinRequestsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MembersJoinRequestsPage();
    },
  );
}

/// generated route for
/// [MembersRolesPage]
class MembersRolesRoute extends PageRouteInfo<void> {
  const MembersRolesRoute({List<PageRouteInfo>? children})
      : super(
          MembersRolesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembersRolesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MembersRolesPage();
    },
  );
}

/// generated route for
/// [MembersStatusesPage]
class MembersStatusesRoute extends PageRouteInfo<void> {
  const MembersStatusesRoute({List<PageRouteInfo>? children})
      : super(
          MembersStatusesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembersStatusesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MembersStatusesPage();
    },
  );
}

/// generated route for
/// [MembersUsersPage]
class MembersUsersRoute extends PageRouteInfo<void> {
  const MembersUsersRoute({List<PageRouteInfo>? children})
      : super(
          MembersUsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembersUsersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MembersUsersPage();
    },
  );
}

/// generated route for
/// [ModuleMenuPage]
class ModuleMenuRoute extends PageRouteInfo<void> {
  const ModuleMenuRoute({List<PageRouteInfo>? children})
      : super(
          ModuleMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'ModuleMenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ModuleMenuPage();
    },
  );
}

/// generated route for
/// [ModulePage]
class ModuleRoute extends PageRouteInfo<void> {
  const ModuleRoute({List<PageRouteInfo>? children})
      : super(
          ModuleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ModuleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ModulePage();
    },
  );
}
