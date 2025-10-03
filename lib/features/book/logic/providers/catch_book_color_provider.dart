import 'package:book_app/features/book/repositories/colors_repository.dart';
import 'package:flutter/material.dart';

class CatchBookColorProvider extends ChangeNotifier {
  Color initColor = ColorsRepository().browns[7];
  void catchColor(Color newColor) {
    initColor = newColor;
    notifyListeners();
  }
}
