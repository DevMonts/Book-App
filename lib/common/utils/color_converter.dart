import 'dart:ui';

Color colorConverter(
  String hexColor,
) {
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
