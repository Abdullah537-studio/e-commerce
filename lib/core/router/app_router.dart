import 'package:e_commerce_app/core/app/splash_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/home_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/main_pages.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/notification_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/order_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteNamedScreen.initialRoute:
        return MaterialPageRoute(builder: (context) => SplashPage());
      case RouteNamedScreen.mainPages:
        return MaterialPageRoute(builder: (context) => MainPages());
      case RouteNamedScreen.home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case RouteNamedScreen.notification:
        return MaterialPageRoute(builder: (context) => NotificationPage());
      case RouteNamedScreen.order:
        return MaterialPageRoute(builder: (context) => OrderPage());
      case RouteNamedScreen.setting:
        return MaterialPageRoute(builder: (context) => SettingPage());
    }
    return null;
  }
}

class RouteNamedScreen {
  static const String initialRoute = '/';
  static const String register = '/register_screen';
  static const String login = '/login_screen';
  static const String mainPages = '/main_pages';
  static const String home = '/home_screen';
  static const String notification = '/notification_screen';
  static const String order = '/order_screen';
  static const String setting = '/setting_screen';
}
