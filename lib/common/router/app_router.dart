import 'package:book_app/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const AuthPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const AuthPage(),
        );
    }
  }
}
