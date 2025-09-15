import 'package:book_app/common/utils/icons_converter.dart';
import 'package:flutter/material.dart';

class BookIconWidget extends StatelessWidget {
  final dynamic book;
  const BookIconWidget({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      IconsConverter.getIconFromString(
        book['icon'] as String,
      ),
      color: (() {
        switch (book['icon'] as String) {
          case 'ac_unit':
            return Colors.cyanAccent;

          case 'anchor':
            return Colors.grey;

          case 'brightness_3':
            return Colors.yellow;

          case 'church':
            return Colors.white;

          case 'cloud':
            return Colors.white;

          case 'cottage':
            return Colors.orange;

          case 'deck':
            return Colors.brown;

          case 'delete':
            return Colors.grey;

          case 'electric_bolt':
            return Colors.yellow;

          case 'explore':
            return Colors.grey;

          case 'favorite':
            return Colors.red;

          case 'heart_broken':
            return Colors.red;

          case 'local_fire_department':
            return Colors.orange;

          case 'local_florist':
            return Colors.pink;

          case 'local_pizza':
            return Colors.yellow;

          case 'sunny':
            return Colors.yellow;

          default:
            return null;
        }
      })(),
    );
  }
}
