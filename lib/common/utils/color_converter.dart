import 'dart:ui';

import 'package:book_app/common/constants/app_colors.dart';

Color colorConverter(
  String hexColor,
) {
  if (hexColor.isEmpty) {
    return AppColors.violetBlue;
  }
  hexColor = hexColor.replaceAll(
    '#',
    '',
  );
  return Color(
    int.parse(
      hexColor,
      radix: 16,
    ),
  );
}
