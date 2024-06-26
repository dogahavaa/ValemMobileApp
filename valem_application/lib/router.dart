import 'package:flutter/material.dart';
import 'package:valem_application/main.dart';
import 'package:valem_application/pages/account.dart';
import 'package:valem_application/pages/login_page.dart';
import 'package:valem_application/pages/profile.dart';
import 'package:valem_application/pages/register_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case accountRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => const MyProfile());
      default:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
    }
  }
}

const String homeRoute = '/';
const String accountRoute = '/accountScreen';
const String registerRoute = '/registerScreen';
const String loginRoute = '/loginScreen';
const String profileRoute = '/profileScreen';
