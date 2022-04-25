import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_auth_classic/features/auth/presentation/state/auth_bloc/auth_bloc.dart';
import 'package:firebase_auth_classic/presentation/routes/auto_router.dart';
import 'package:firebase_auth_classic/presentation/themes/main_theme.dart';
import 'package:firebase_auth_classic/firebase_options.dart';
import 'package:firebase_auth_classic/injections/injection.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await configureDependecies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();
    return BlocProvider(
      create: (context) =>
          locator<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
      child: MaterialApp.router(
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(router),
      ),
    );
  }
}
