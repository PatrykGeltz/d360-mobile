// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutPage();
    },
  );
}

/// generated route for
/// [AppSettingsPage]
class AppSettingsRoute extends PageRouteInfo<void> {
  const AppSettingsRoute({List<PageRouteInfo>? children})
      : super(
          AppSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppSettingsPage();
    },
  );
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePasswordPage();
    },
  );
}

/// generated route for
/// [ContributionsContributionsPage]
class ContributionsContributionsRoute extends PageRouteInfo<void> {
  const ContributionsContributionsRoute({List<PageRouteInfo>? children})
      : super(
          ContributionsContributionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContributionsContributionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContributionsContributionsPage();
    },
  );
}

/// generated route for
/// [ContributionsDictionaryPage]
class ContributionsDictionaryRoute extends PageRouteInfo<void> {
  const ContributionsDictionaryRoute({List<PageRouteInfo>? children})
      : super(
          ContributionsDictionaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContributionsDictionaryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContributionsDictionaryPage();
    },
  );
}

/// generated route for
/// [ContributionsHistoryPage]
class ContributionsHistoryRoute extends PageRouteInfo<void> {
  const ContributionsHistoryRoute({List<PageRouteInfo>? children})
      : super(
          ContributionsHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContributionsHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContributionsHistoryPage();
    },
  );
}

/// generated route for
/// [ContributionsMenuPage]
class ContributionsMenuRoute extends PageRouteInfo<void> {
  const ContributionsMenuRoute({List<PageRouteInfo>? children})
      : super(
          ContributionsMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContributionsMenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContributionsMenuPage();
    },
  );
}

/// generated route for
/// [ContributionsPage]
class ContributionsRoute extends PageRouteInfo<void> {
  const ContributionsRoute({List<PageRouteInfo>? children})
      : super(
          ContributionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContributionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContributionsPage();
    },
  );
}

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
/// [MarinaLockersPage]
class MarinaLockersRoute extends PageRouteInfo<void> {
  const MarinaLockersRoute({List<PageRouteInfo>? children})
      : super(
          MarinaLockersRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarinaLockersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MarinaLockersPage();
    },
  );
}

/// generated route for
/// [MarinaMenuPage]
class MarinaMenuRoute extends PageRouteInfo<void> {
  const MarinaMenuRoute({List<PageRouteInfo>? children})
      : super(
          MarinaMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarinaMenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MarinaMenuPage();
    },
  );
}

/// generated route for
/// [MarinaPage]
class MarinaRoute extends PageRouteInfo<void> {
  const MarinaRoute({List<PageRouteInfo>? children})
      : super(
          MarinaRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarinaRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MarinaPage();
    },
  );
}

/// generated route for
/// [MarinaParkingSpacesPage]
class MarinaParkingSpacesRoute extends PageRouteInfo<void> {
  const MarinaParkingSpacesRoute({List<PageRouteInfo>? children})
      : super(
          MarinaParkingSpacesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarinaParkingSpacesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MarinaParkingSpacesPage();
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
/// [MembersMemberPage]
class MembersMemberRoute extends PageRouteInfo<MembersMemberRouteArgs> {
  MembersMemberRoute({
    Key? key,
    required String? id,
    required String? name,
    String? pesel = '* Nie podano *',
    String? email = '* Nie podano *',
    String? phone = '* Nie podano *',
    String? city = '* Nie podano *',
    String? address = '* Nie podano *',
    String? dateOfApproval = '',
    String? registerStatus = '',
    List<PageRouteInfo>? children,
  }) : super(
          MembersMemberRoute.name,
          args: MembersMemberRouteArgs(
            key: key,
            id: id,
            name: name,
            pesel: pesel,
            email: email,
            phone: phone,
            city: city,
            address: address,
            dateOfApproval: dateOfApproval,
            registerStatus: registerStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'MembersMemberRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MembersMemberRouteArgs>();
      return MembersMemberPage(
        key: args.key,
        id: args.id,
        name: args.name,
        pesel: args.pesel,
        email: args.email,
        phone: args.phone,
        city: args.city,
        address: args.address,
        dateOfApproval: args.dateOfApproval,
        registerStatus: args.registerStatus,
      );
    },
  );
}

class MembersMemberRouteArgs {
  const MembersMemberRouteArgs({
    this.key,
    required this.id,
    required this.name,
    this.pesel = '* Nie podano *',
    this.email = '* Nie podano *',
    this.phone = '* Nie podano *',
    this.city = '* Nie podano *',
    this.address = '* Nie podano *',
    this.dateOfApproval = '',
    this.registerStatus = '',
  });

  final Key? key;

  final String? id;

  final String? name;

  final String? pesel;

  final String? email;

  final String? phone;

  final String? city;

  final String? address;

  final String? dateOfApproval;

  final String? registerStatus;

  @override
  String toString() {
    return 'MembersMemberRouteArgs{key: $key, id: $id, name: $name, pesel: $pesel, email: $email, phone: $phone, city: $city, address: $address, dateOfApproval: $dateOfApproval, registerStatus: $registerStatus}';
  }
}

/// generated route for
/// [MembersMenuPage]
class MembersMenuRoute extends PageRouteInfo<void> {
  const MembersMenuRoute({List<PageRouteInfo>? children})
      : super(
          MembersMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembersMenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MembersMenuPage();
    },
  );
}

/// generated route for
/// [MembersPage]
class MembersRoute extends PageRouteInfo<void> {
  const MembersRoute({List<PageRouteInfo>? children})
      : super(
          MembersRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MembersPage();
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
class ModuleMenuRoute extends PageRouteInfo<ModuleMenuRouteArgs> {
  ModuleMenuRoute({
    Key? key,
    required String route,
    List<PageRouteInfo>? children,
  }) : super(
          ModuleMenuRoute.name,
          args: ModuleMenuRouteArgs(
            key: key,
            route: route,
          ),
          initialChildren: children,
        );

  static const String name = 'ModuleMenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ModuleMenuRouteArgs>();
      return ModuleMenuPage(
        key: args.key,
        route: args.route,
      );
    },
  );
}

class ModuleMenuRouteArgs {
  const ModuleMenuRouteArgs({
    this.key,
    required this.route,
  });

  final Key? key;

  final String route;

  @override
  String toString() {
    return 'ModuleMenuRouteArgs{key: $key, route: $route}';
  }
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

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [SailorPermissionsMemberPermissionsPage]
class SailorPermissionsMemberPermissionsRoute extends PageRouteInfo<void> {
  const SailorPermissionsMemberPermissionsRoute({List<PageRouteInfo>? children})
      : super(
          SailorPermissionsMemberPermissionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SailorPermissionsMemberPermissionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SailorPermissionsMemberPermissionsPage();
    },
  );
}

/// generated route for
/// [SailorPermissionsMenuPage]
class SailorPermissionsMenuRoute extends PageRouteInfo<void> {
  const SailorPermissionsMenuRoute({List<PageRouteInfo>? children})
      : super(
          SailorPermissionsMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'SailorPermissionsMenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SailorPermissionsMenuPage();
    },
  );
}

/// generated route for
/// [SailorPermissionsPage]
class SailorPermissionsRoute extends PageRouteInfo<void> {
  const SailorPermissionsRoute({List<PageRouteInfo>? children})
      : super(
          SailorPermissionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SailorPermissionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SailorPermissionsPage();
    },
  );
}

/// generated route for
/// [SailorPermissionsPermissionTypesPage]
class SailorPermissionsPermissionTypesRoute extends PageRouteInfo<void> {
  const SailorPermissionsPermissionTypesRoute({List<PageRouteInfo>? children})
      : super(
          SailorPermissionsPermissionTypesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SailorPermissionsPermissionTypesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SailorPermissionsPermissionTypesPage();
    },
  );
}

/// generated route for
/// [SailorPermissionsPermissionsPage]
class SailorPermissionsPermissionsRoute extends PageRouteInfo<void> {
  const SailorPermissionsPermissionsRoute({List<PageRouteInfo>? children})
      : super(
          SailorPermissionsPermissionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SailorPermissionsPermissionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SailorPermissionsPermissionsPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [StatusesPage]
class StatusesRoute extends PageRouteInfo<void> {
  const StatusesRoute({List<PageRouteInfo>? children})
      : super(
          StatusesRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatusesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StatusesPage();
    },
  );
}
