import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.oliveGreen,
      //Obsolete:
      //background: AppColors.paper,
    ),
    scaffoldBackgroundColor: AppColors.darkWood,
  );
}
