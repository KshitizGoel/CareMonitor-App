import 'package:boilerplate/ui/find_flights/find_flights.dart';
import 'package:boilerplate/ui/landing/landing.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String findFlights = '/findFlights';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    dashboard: (BuildContext context) => Landing(0),
    findFlights: (BuildContext context) => FindFlights(),
  };
}
