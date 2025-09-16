import 'package:book_app/common/constants/app_theme.dart';
import 'package:book_app/common/router/app_router.dart';
import 'package:book_app/features/auth/logic/providers/auth_provider.dart';
import 'package:book_app/features/main/presentation/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isLogged = context.select<AuthProvider, bool>(
      (authProvider) => authProvider.isLogged,
    );
    return MaterialApp(
      title: 'Book App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: isLogged
          ? MainPage(
              initialIndex: 1,
            )
          : null,
    );
  }
}
