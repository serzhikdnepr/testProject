// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:test_project/data/data.dart' as _i10;
import 'package:test_project/screens/edit_item_screen.dart' as _i1;
import 'package:test_project/screens/error_screen.dart' as _i2;
import 'package:test_project/screens/home_screen.dart' as _i3;
import 'package:test_project/screens/loading_screen.dart' as _i4;
import 'package:test_project/screens/login_page.dart' as _i5;
import 'package:test_project/screens/main_page.dart' as _i6;
import 'package:test_project/screens/profile_page.dart' as _i7;

abstract class $RootRouter extends _i8.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    EditItemRoute.name: (routeData) {
      final args = routeData.argsAs<EditItemRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.EditItemScreen(
          key: args.key,
          item: args.item,
        ),
      );
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ErrorScreen(
          args.e,
          args.trace,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LoadingRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoadingScreen(),
      );
    },
    LoginPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    MainPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MainPage(),
      );
    },
    ProfilePage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.EditItemScreen]
class EditItemRoute extends _i8.PageRouteInfo<EditItemRouteArgs> {
  EditItemRoute({
    _i9.Key? key,
    required _i10.Item item,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          EditItemRoute.name,
          args: EditItemRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'EditItemRoute';

  static const _i8.PageInfo<EditItemRouteArgs> page =
      _i8.PageInfo<EditItemRouteArgs>(name);
}

class EditItemRouteArgs {
  const EditItemRouteArgs({
    this.key,
    required this.item,
  });

  final _i9.Key? key;

  final _i10.Item item;

  @override
  String toString() {
    return 'EditItemRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [_i2.ErrorScreen]
class ErrorRoute extends _i8.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    required Object e,
    required StackTrace? trace,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            e: e,
            trace: trace,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const _i8.PageInfo<ErrorRouteArgs> page =
      _i8.PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    required this.e,
    required this.trace,
    this.key,
  });

  final Object e;

  final StackTrace? trace;

  final _i9.Key? key;

  @override
  String toString() {
    return 'ErrorRouteArgs{e: $e, trace: $trace, key: $key}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoadingScreen]
class LoadingRoute extends _i8.PageRouteInfo<void> {
  const LoadingRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginPage extends _i8.PageRouteInfo<void> {
  const LoginPage({List<_i8.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MainPage]
class MainPage extends _i8.PageRouteInfo<void> {
  const MainPage({List<_i8.PageRouteInfo>? children})
      : super(
          MainPage.name,
          initialChildren: children,
        );

  static const String name = 'MainPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfilePage]
class ProfilePage extends _i8.PageRouteInfo<void> {
  const ProfilePage({List<_i8.PageRouteInfo>? children})
      : super(
          ProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
