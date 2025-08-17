import 'dart:math';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BookcaseProvider extends ChangeNotifier {
  //TODO: editBook

  //TODO: deleteBook

  final List<Color> colorsList = [
    AppColors.larissaGreen,
    AppColors.wine,
    AppColors.yellowHerryPotter,
  ];
  final random = Random();
  Color randomizeColors() {
    final index = random.nextInt(colorsList.length);
    return colorsList[index];
  }
}
