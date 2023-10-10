import 'package:dashboard_ui/screens/menu-screen.dart';
import 'package:dashboard_ui/screens/splash-screen.dart';
import 'package:flutter/material.dart';

const String splash = 'splash';
const String home = 'home';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case home:
      return MaterialPageRoute(builder: (context) => const MenuScreen());
    default:
      throw ('Essa rota não existe');
  }
}