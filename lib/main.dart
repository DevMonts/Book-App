import 'package:book_app/app.dart';
import 'package:book_app/features/register_book/logic/provider/book_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AsyncSnapshot.waiting();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: const App(),
    ),
  );
}
