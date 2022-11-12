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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../main_page/main_page.dart' as _i5;
import '../models/project_model.dart' as _i13;
import '../pages/launch_page.dart' as _i1;
import '../pages/login_page.dart' as _i2;
import '../project_add_page/project_add_page.dart' as _i7;
import '../project_list_page/project_list_page.dart' as _i8;
import '../search_page/search_page.dart' as _i10;
import '../sign_in_page/sign_in_page.dart' as _i3;
import '../sign_up_page/sign_up_page.dart' as _i4;
import '../to_do_add_page/to_do_add_page.dart' as _i6;
import '../to_do_list_page/to_do_list_page.dart' as _i9;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    LaunchRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LaunchPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.SignUpPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.MainPage(),
      );
    },
    TodoRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.TodoPage(),
      );
    },
    ProjectAddRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.ProjectAddPage(),
      );
    },
    ProjectListRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ProjectListPage(),
      );
    },
    TodoListRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.TodoListPage(project: args.project),
      );
    },
    SearchRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.SearchPage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          LaunchRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i11.RouteConfig(
          SignInRoute.name,
          path: '/sign-in-page',
        ),
        _i11.RouteConfig(
          SignUpRoute.name,
          path: '/sign-up-page',
        ),
        _i11.RouteConfig(
          MainRoute.name,
          path: '/main-page',
        ),
        _i11.RouteConfig(
          TodoRoute.name,
          path: '/todo-page',
        ),
        _i11.RouteConfig(
          ProjectAddRoute.name,
          path: '/project-add-page',
        ),
        _i11.RouteConfig(
          ProjectListRoute.name,
          path: '/project-list-page',
        ),
        _i11.RouteConfig(
          TodoListRoute.name,
          path: '/todo-list-page',
        ),
        _i11.RouteConfig(
          SearchRoute.name,
          path: '/search-page',
        ),
      ];
}

/// generated route for
/// [_i1.LaunchPage]
class LaunchRoute extends _i11.PageRouteInfo<void> {
  const LaunchRoute()
      : super(
          LaunchRoute.name,
          path: '/',
        );

  static const String name = 'LaunchRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in-page',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/sign-up-page',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-page',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i6.TodoPage]
class TodoRoute extends _i11.PageRouteInfo<void> {
  const TodoRoute()
      : super(
          TodoRoute.name,
          path: '/todo-page',
        );

  static const String name = 'TodoRoute';
}

/// generated route for
/// [_i7.ProjectAddPage]
class ProjectAddRoute extends _i11.PageRouteInfo<void> {
  const ProjectAddRoute()
      : super(
          ProjectAddRoute.name,
          path: '/project-add-page',
        );

  static const String name = 'ProjectAddRoute';
}

/// generated route for
/// [_i8.ProjectListPage]
class ProjectListRoute extends _i11.PageRouteInfo<void> {
  const ProjectListRoute()
      : super(
          ProjectListRoute.name,
          path: '/project-list-page',
        );

  static const String name = 'ProjectListRoute';
}

/// generated route for
/// [_i9.TodoListPage]
class TodoListRoute extends _i11.PageRouteInfo<TodoListRouteArgs> {
  TodoListRoute({required _i13.Project project})
      : super(
          TodoListRoute.name,
          path: '/todo-list-page',
          args: TodoListRouteArgs(project: project),
        );

  static const String name = 'TodoListRoute';
}

class TodoListRouteArgs {
  const TodoListRouteArgs({required this.project});

  final _i13.Project project;

  @override
  String toString() {
    return 'TodoListRouteArgs{project: $project}';
  }
}

/// generated route for
/// [_i10.SearchPage]
class SearchRoute extends _i11.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '/search-page',
        );

  static const String name = 'SearchRoute';
}
