import 'package:book_app/app.dart';
import 'package:book_app/features/auth/logic/providers/auth_provider.dart';
import 'package:book_app/features/auth/logic/providers/password_view_provider.dart';
import 'package:book_app/features/book/logic/provider/delete_book_provider.dart';
import 'package:book_app/features/book/logic/provider/random_colors_provider.dart';
import 'package:book_app/features/book/logic/provider/register_book_provider.dart';
import 'package:book_app/features/book/logic/provider/show_books_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AsyncSnapshot.waiting();
  await Firebase.initializeApp();
  final authProvider = AuthProvider();
  await authProvider.logged();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PasswordViewProvider(),
        ),
        ChangeNotifierProvider.value(
          value: //create: (context) => A
              authProvider, //()
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterBookProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShowBooksProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => RandomColorsProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => DeleteBookProvider(),
        ),
      ],
      child: const App(),
    ),
  );
}
