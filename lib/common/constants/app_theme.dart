import 'package:book_app/features/book/repositories/colors_repository.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorsRepository().browns[9],
      onPrimary: ColorsRepository().browns[2],
      secondary: ColorsRepository().browns[2],
      onSecondary: ColorsRepository().browns[9],
      error: Colors.red,
      onError: ColorsRepository().browns[7],
      surface: ColorsRepository().browns[2],
      onSurface: ColorsRepository().browns[13],
    ),
    scaffoldBackgroundColor: ColorsRepository().browns[6],
  );
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ColorsRepository().browns[8],
      onPrimary: ColorsRepository().browns[13],
      secondary: ColorsRepository().browns[13],
      onSecondary: ColorsRepository().browns[8],
      error: Colors.red,
      onError: ColorsRepository().browns[7],
      surface: ColorsRepository().browns[10],
      onSurface: ColorsRepository().browns[2],
    ),
    scaffoldBackgroundColor: ColorsRepository().browns[13],
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
                        ? ColorsRepository().browns[5]
                        : ColorsRepository().browns[12],
                    height: 110,
                  ),
                  Container(
                    color:
                        Theme.of(
                              context,
                            ).brightness ==
                            Brightness.light
                        ? ColorsRepository().browns[2]
                        : ColorsRepository().browns[10],
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
