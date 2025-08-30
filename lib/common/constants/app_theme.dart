import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme:
        ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.brown07,
          onPrimary: AppColors.violetBlue,
          secondary: AppColors.violetBlue,
          onSecondary: AppColors.pink,
          error: AppColors.red,
          onError: AppColors.brown08,
          surface: AppColors.violetBlue,
          onSurface: AppColors.pink,
        ),
    scaffoldBackgroundColor: AppColors.
        brown14,
  );
  static final ThemeData darkTheme = ThemeData(
    colorScheme:
        ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.pink,
          onPrimary: AppColors.violetBlue,
          secondary: AppColors.violetBlue,
          onSecondary: AppColors.pink,
          error: AppColors.red,
          onError: AppColors.brown08,
          surface: AppColors.brown14,
          onSurface: AppColors.brown13,
        ),
  );
  static Widget bookcaseBg(
    BuildContext context,
    int bookcaseRows,
  ) {
    return Column(
      children: List.generate(
        bookcaseRows,
        (_) {
          return Column(
            children: [
              SizedBox(
                height: 160,
              ),
              Divider(
                color: AppColors.brown13,
                thickness: 100,
              ),
              Divider(
                color: AppColors.brown13,
                thickness: 12,
              ),
            ],
          );
        },
      ),
    );
  }
}
