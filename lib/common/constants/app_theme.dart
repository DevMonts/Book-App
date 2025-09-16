import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.brown10,
      onPrimary: AppColors.brown03,
      secondary: AppColors.brown03,
      onSecondary: AppColors.brown10,
      error: Colors.red,
      onError: AppColors.brown08,
      surface: AppColors.brown03,
      onSurface: AppColors.brown14,
    ),
    scaffoldBackgroundColor: AppColors.brown07,
  );
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.brown09,
      onPrimary: AppColors.brown14,
      secondary: AppColors.brown14,
      onSecondary: AppColors.brown09,
      error: Colors.red,
      onError: AppColors.brown08,
      surface: AppColors.brown11,
      onSurface: AppColors.brown03,
    ),
    scaffoldBackgroundColor: AppColors.brown14,
  );
  static Widget bookcaseBg(
    BuildContext context,
    int bookcaseRows,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Column(
          children: List.generate(
            bookcaseRows,
            (
              _,
            ) {
              return Column(
                children: [
                  Container(
                    color:
                        Theme.of(
                              context,
                            ).brightness ==
                            Brightness.light
                        ? AppColors.brown06
                        : AppColors.brown13,
                    height: 110,
                  ),
                  Container(
                    color:
                        Theme.of(
                              context,
                            ).brightness ==
                            Brightness.light
                        ? AppColors.brown03
                        : AppColors.brown11,
                    height: 20,
                  ),
                  SizedBox(
                    height: 112,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
