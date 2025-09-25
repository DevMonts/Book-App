import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CatchBookColorProvider extends ChangeNotifier {
  Color initColor = AppColors.brown08;
  void catchColor(Color newColor) {
    initColor = newColor;
    notifyListeners();
  }
}
