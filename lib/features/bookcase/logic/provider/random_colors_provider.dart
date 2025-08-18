import 'dart:math';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RandomColorsProvider extends ChangeNotifier {
  final List<Color> colorsList = [
    AppColors.larissaGreen,
    AppColors.larissaDarkGreenBook,
    AppColors.wine,
    AppColors.yellowHerryPotter,
    AppColors.beigeBook,
    AppColors.blueBook,
    AppColors.darkBrowBook,
    AppColors.lightBrowBook,
  ];
  final random = Random();
  Color randomizeColors() {
    final index = random.nextInt(colorsList.length);
    return colorsList[index];
  }
}
