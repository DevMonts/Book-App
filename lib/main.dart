import 'package:book_app/app.dart';
import 'package:book_app/features/bookcase/logic/provider/bookcase_provider.dart';
import 'package:book_app/features/register_book/logic/provider/register_book_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AsyncSnapshot.waiting();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterBookProvider()),
        ChangeNotifierProvider(create: (context) => BookcaseProvider()),
      ],
      child: const App(),
    ),
  );
}
