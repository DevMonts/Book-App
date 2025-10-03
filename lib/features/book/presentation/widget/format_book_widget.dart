import 'package:book_app/common/constants/app_card.dart';
import 'package:book_app/common/constants/app_switch.dart';
import 'package:flutter/material.dart';

class FormatBookWidget extends StatefulWidget {
  const FormatBookWidget({
    super.key,
    required this.isEbook,
    required this.onChanged,
  });

  final bool isEbook;
  final ValueChanged<bool> onChanged;

  @override
  State<FormatBookWidget> createState() => _FormatBookWidgetState();
}

class _FormatBookWidgetState extends State<FormatBookWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Físico ou Ebook?',
        ),
        AppCard(
          child: AppSwitch(
            icon1: Icons.book,
            icon2: Icons.tablet_android,
            value: widget.isEbook,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
