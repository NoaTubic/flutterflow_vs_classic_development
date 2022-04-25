import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth_classic/injections/injection.dart';
import 'package:firebase_auth_classic/presentation/resources.dart';

class RouteService {
  static void goToPage(
      {required PageRouteInfo<dynamic> route, int duration = 0}) {
    Timer(Duration(seconds: duration), () {
      locator<AppRouter>().replace(route);
    });
  }
}
