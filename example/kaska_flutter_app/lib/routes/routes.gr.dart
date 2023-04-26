// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/foundation.dart' as _i4;
import 'package:flutter/material.dart' as _i3;
import 'package:kaskazini/util/service_locator.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter({
    _i3.GlobalKey<_i3.NavigatorState>? navigatorKey,
    required this.appAuthGuard,
  }) : super(navigatorKey);

  final _i1.AppAuthGuard appAuthGuard;

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AuthLoginRoute.name: (routeData) {
      final args = routeData.argsAs<AuthLoginRouteArgs>(
          orElse: () => const AuthLoginRouteArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.AuthLoginPage(key: args.key),
      );
    },
    AuthWaitLoginRoute.name: (routeData) {
      final args = routeData.argsAs<AuthWaitLoginRouteArgs>(
          orElse: () => const AuthWaitLoginRouteArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.AuthWaitLoginPage(key: args.key),
      );
    },
    AuthWaitLogoutRoute.name: (routeData) {
      final args = routeData.argsAs<AuthWaitLogoutRouteArgs>(
          orElse: () => const AuthWaitLogoutRouteArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.AuthWaitLogoutPage(key: args.key),
      );
    },
    AuthErrorRoute.name: (routeData) {
      final args = routeData.argsAs<AuthErrorRouteArgs>(
          orElse: () => const AuthErrorRouteArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.AuthErrorPage(key: args.key),
      );
    },
    IntroRoute.name: (routeData) {
      final args = routeData.argsAs<IntroRouteArgs>(
          orElse: () => const IntroRouteArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.IntroWrapperPage(key: args.key),
      );
    },
    MainAppRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainAppPage(),
      );
    },
    AppInitRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    AppInitRoute.name: (routeData) {
      final args = routeData.argsAs<AppInitRouteArgs>(
          orElse: () => const AppInitRouteArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.AppInitPage(key: args.key),
      );
    },
    KaskaRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    ChatRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    AccountRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    KaskaRoute.name: (routeData) {
      final args = routeData.argsAs<KaskaRouteArgs>(
          orElse: () => const KaskaRouteArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.KaskaPage(key: args.key),
      );
    },
    ChatRoute.name: (routeData) {
      final args =
          routeData.argsAs<ChatRouteArgs>(orElse: () => const ChatRouteArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.ChatPage(key: args.key),
      );
    },
    AccountRoute.name: (routeData) {
      final args = routeData.argsAs<AccountRouteArgs>(
          orElse: () => const AccountRouteArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.AccountPage(key: args.key),
      );
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/intro',
          fullMatch: true,
        ),
        _i2.RouteConfig(
          AuthLoginRoute.name,
          path: '/login',
        ),
        _i2.RouteConfig(
          AuthWaitLoginRoute.name,
          path: '/auth-wait-login',
        ),
        _i2.RouteConfig(
          AuthWaitLogoutRoute.name,
          path: '/auth-wait-logout',
        ),
        _i2.RouteConfig(
          AuthErrorRoute.name,
          path: '/auth-error',
        ),
        _i2.RouteConfig(
          IntroRoute.name,
          path: '/intro',
          children: [
            _i2.RouteConfig(
              AppInitRouter.name,
              path: 'appinit',
              parent: IntroRoute.name,
              children: [
                _i2.RouteConfig(
                  AppInitRoute.name,
                  path: '',
                  parent: AppInitRouter.name,
                )
              ],
            )
          ],
        ),
        _i2.RouteConfig(
          MainAppRouter.name,
          path: '/kaskazini',
          guards: [appAuthGuard],
          children: [
            _i2.RouteConfig(
              '#redirect',
              path: '',
              parent: MainAppRouter.name,
              redirectTo: 'chat',
              fullMatch: true,
            ),
            _i2.RouteConfig(
              KaskaRouter.name,
              path: 'kaska',
              parent: MainAppRouter.name,
              children: [
                _i2.RouteConfig(
                  KaskaRoute.name,
                  path: '',
                  parent: KaskaRouter.name,
                )
              ],
            ),
            _i2.RouteConfig(
              ChatRouter.name,
              path: 'chat',
              parent: MainAppRouter.name,
              children: [
                _i2.RouteConfig(
                  ChatRoute.name,
                  path: '',
                  parent: ChatRouter.name,
                )
              ],
            ),
            _i2.RouteConfig(
              AccountRouter.name,
              path: 'account',
              parent: MainAppRouter.name,
              children: [
                _i2.RouteConfig(
                  AccountRoute.name,
                  path: '',
                  parent: AccountRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AuthLoginPage]
class AuthLoginRoute extends _i2.PageRouteInfo<AuthLoginRouteArgs> {
  AuthLoginRoute({_i4.Key? key})
      : super(
          AuthLoginRoute.name,
          path: '/login',
          args: AuthLoginRouteArgs(key: key),
        );

  static const String name = 'AuthLoginRoute';
}

class AuthLoginRouteArgs {
  const AuthLoginRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AuthLoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.AuthWaitLoginPage]
class AuthWaitLoginRoute extends _i2.PageRouteInfo<AuthWaitLoginRouteArgs> {
  AuthWaitLoginRoute({_i4.Key? key})
      : super(
          AuthWaitLoginRoute.name,
          path: '/auth-wait-login',
          args: AuthWaitLoginRouteArgs(key: key),
        );

  static const String name = 'AuthWaitLoginRoute';
}

class AuthWaitLoginRouteArgs {
  const AuthWaitLoginRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AuthWaitLoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.AuthWaitLogoutPage]
class AuthWaitLogoutRoute extends _i2.PageRouteInfo<AuthWaitLogoutRouteArgs> {
  AuthWaitLogoutRoute({_i4.Key? key})
      : super(
          AuthWaitLogoutRoute.name,
          path: '/auth-wait-logout',
          args: AuthWaitLogoutRouteArgs(key: key),
        );

  static const String name = 'AuthWaitLogoutRoute';
}

class AuthWaitLogoutRouteArgs {
  const AuthWaitLogoutRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AuthWaitLogoutRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.AuthErrorPage]
class AuthErrorRoute extends _i2.PageRouteInfo<AuthErrorRouteArgs> {
  AuthErrorRoute({_i4.Key? key})
      : super(
          AuthErrorRoute.name,
          path: '/auth-error',
          args: AuthErrorRouteArgs(key: key),
        );

  static const String name = 'AuthErrorRoute';
}

class AuthErrorRouteArgs {
  const AuthErrorRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AuthErrorRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.IntroWrapperPage]
class IntroRoute extends _i2.PageRouteInfo<IntroRouteArgs> {
  IntroRoute({
    _i4.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          IntroRoute.name,
          path: '/intro',
          args: IntroRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'IntroRoute';
}

class IntroRouteArgs {
  const IntroRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'IntroRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.MainAppPage]
class MainAppRouter extends _i2.PageRouteInfo<void> {
  const MainAppRouter({List<_i2.PageRouteInfo>? children})
      : super(
          MainAppRouter.name,
          path: '/kaskazini',
          initialChildren: children,
        );

  static const String name = 'MainAppRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class AppInitRouter extends _i2.PageRouteInfo<void> {
  const AppInitRouter({List<_i2.PageRouteInfo>? children})
      : super(
          AppInitRouter.name,
          path: 'appinit',
          initialChildren: children,
        );

  static const String name = 'AppInitRouter';
}

/// generated route for
/// [_i1.AppInitPage]
class AppInitRoute extends _i2.PageRouteInfo<AppInitRouteArgs> {
  AppInitRoute({_i4.Key? key})
      : super(
          AppInitRoute.name,
          path: '',
          args: AppInitRouteArgs(key: key),
        );

  static const String name = 'AppInitRoute';
}

class AppInitRouteArgs {
  const AppInitRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AppInitRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.EmptyRouterPage]
class KaskaRouter extends _i2.PageRouteInfo<void> {
  const KaskaRouter({List<_i2.PageRouteInfo>? children})
      : super(
          KaskaRouter.name,
          path: 'kaska',
          initialChildren: children,
        );

  static const String name = 'KaskaRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ChatRouter extends _i2.PageRouteInfo<void> {
  const ChatRouter({List<_i2.PageRouteInfo>? children})
      : super(
          ChatRouter.name,
          path: 'chat',
          initialChildren: children,
        );

  static const String name = 'ChatRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class AccountRouter extends _i2.PageRouteInfo<void> {
  const AccountRouter({List<_i2.PageRouteInfo>? children})
      : super(
          AccountRouter.name,
          path: 'account',
          initialChildren: children,
        );

  static const String name = 'AccountRouter';
}

/// generated route for
/// [_i1.KaskaPage]
class KaskaRoute extends _i2.PageRouteInfo<KaskaRouteArgs> {
  KaskaRoute({_i4.Key? key})
      : super(
          KaskaRoute.name,
          path: '',
          args: KaskaRouteArgs(key: key),
        );

  static const String name = 'KaskaRoute';
}

class KaskaRouteArgs {
  const KaskaRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'KaskaRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.ChatPage]
class ChatRoute extends _i2.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({_i4.Key? key})
      : super(
          ChatRoute.name,
          path: '',
          args: ChatRouteArgs(key: key),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i2.PageRouteInfo<AccountRouteArgs> {
  AccountRoute({_i4.Key? key})
      : super(
          AccountRoute.name,
          path: '',
          args: AccountRouteArgs(key: key),
        );

  static const String name = 'AccountRoute';
}

class AccountRouteArgs {
  const AccountRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AccountRouteArgs{key: $key}';
  }
}
