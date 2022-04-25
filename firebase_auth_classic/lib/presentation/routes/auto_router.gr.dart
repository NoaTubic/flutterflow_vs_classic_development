// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'auto_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SplashPage(),
          opaque: true,
          barrierDismissible: false);
    },
    SignInRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignInPage(),
          opaque: true,
          barrierDismissible: false);
    },
    SignUpRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignUpPage(),
          opaque: true,
          barrierDismissible: false);
    },
    ResetPasswordRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const ResetPasswordPage(),
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomePage(),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        RouteConfig(ResetPasswordRoute.name, path: '/reset-password-page'),
        RouteConfig(HomeRoute.name, path: '/home-page')
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password-page');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}
