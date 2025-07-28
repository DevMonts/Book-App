import 'package:book_app/app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AsyncSnapshot.waiting();
  runApp(const App());
}
