import 'package:book_app/common/constants/app_theme.dart';
import 'package:book_app/features/register_book/presentation/page/register_book_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book App',
      theme: AppTheme.lightTheme,
      home: const RegisterBookPage(),
    );
  }
}
