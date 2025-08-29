import 'package:book_app/features/auth/presentation/pages/auth_page.dart';
import 'package:book_app/features/bookcase/presentation/page/bookcase_page.dart';
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
      // case '/register':
      //   return MaterialPageRoute(
      //     builder: (context) => const RegisterUserPage(),
      //   );
      case '/bookcase':
        return MaterialPageRoute(
          builder: (context) => const BookcasePage(),
        );
      // case '/bookList':
      //   return MaterialPageRoute(
      //     builder: (context) => const BookList(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) => const AuthPage(),
        );
    }
  }
}
