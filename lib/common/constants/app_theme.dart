import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.larissaGreen,
      //Obsolete:
      //background: AppColors.paper,
    ),
    scaffoldBackgroundColor: AppColors.darkWood,
  );
  static Widget bookcaseBg(
    BuildContext context,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 160,
        ),
        Divider(
          color: AppColors.middleWood,
          thickness: 100,
        ),
        Divider(
          color: AppColors.middleWood,
          thickness: 12,
        ),
        SizedBox(
          height: 160,
        ),
        Divider(
          color: AppColors.middleWood,
          thickness: 100,
        ),
        Divider(
          color: AppColors.middleWood,
          thickness: 12,
        ),
        SizedBox(
          height: 160,
        ),
        Divider(
          color: AppColors.middleWood,
          thickness: 100,
        ),
        Divider(
          color: AppColors.middleWood,
          thickness: 12,
        ),
        SizedBox(
          height: 160,
        ),
        Divider(
          color: AppColors.middleWood,
          thickness: 100,
        ),
        Divider(
          color: AppColors.middleWood,
          thickness: 12,
        ),
      ],
    );
  }
}
