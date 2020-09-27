// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/sign_in_form_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String dashboardPage = '/dashboard-page';
  static const String signInFormPage = '/sign-in-form-page';
  static const all = <String>{
    splashPage,
    dashboardPage,
    signInFormPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.dashboardPage, page: DashboardPage),
    RouteDef(Routes.signInFormPage, page: SignInFormPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    DashboardPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardPage(),
        settings: data,
      );
    },
    SignInFormPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignInFormPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashPage() => push<dynamic>(Routes.splashPage);

  Future<dynamic> pushDashboardPage() => push<dynamic>(Routes.dashboardPage);

  Future<dynamic> pushSignInFormPage() => push<dynamic>(Routes.signInFormPage);
}
