import 'package:e_commerce_app/core/app/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteNamedScreen.initialRoute:
        return MaterialPageRoute(builder: (context) => SplashPage());
    }
    return null;
  }
}

class RouteNamedScreen {
  static const String initialRoute = '/';
  static const String home = '/home_screen';
}
