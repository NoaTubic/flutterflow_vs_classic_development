import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth_classic/features/auth/presentation/pages/forgot_password.dart';
import 'package:firebase_auth_classic/features/auth/presentation/pages/sign_in_page.dart';
import 'package:firebase_auth_classic/features/auth/presentation/pages/sign_up_page.dart';
import 'package:firebase_auth_classic/features/home/presentation/pages/home_page.dart';
import 'package:firebase_auth_classic/features/splash/splash_page.dart';

part 'auto_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CustomRoute(
      page: SplashPage,
      initial: true,
    ),
    CustomRoute(
      page: SignInPage,
    ),
    CustomRoute(
      page: SignUpPage,
    ),
    CustomRoute(
      page: ResetPasswordPage,
    ),
    CustomRoute(
      page: HomePage,
    ),
  ],
)
@lazySingleton
class AppRouter extends _$AppRouter {}
