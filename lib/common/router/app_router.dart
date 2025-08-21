import 'package:book_app/features/auth/presentation/pages/login_page.dart';
import 'package:book_app/features/auth/presentation/pages/register_user_page.dart';
import 'package:book_app/features/book/presentation/page/book_list.dart';
import 'package:book_app/features/book/presentation/page/bookcase_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (context) => const RegisterUserPage(),
        );
      case '/bookcase':
        return MaterialPageRoute(
          builder: (context) => const BookcasePage(),
        );
      case '/bookList':
        return MaterialPageRoute(
          builder: (context) => const BookList(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
    }
  }
}
