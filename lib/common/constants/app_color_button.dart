import 'dart:ui';

import 'package:book_app/common/constants/app_card.dart';
import 'package:book_app/common/constants/app_color_widget.dart';
import 'package:flutter/material.dart';

class AppColorButton extends StatefulWidget {
  const AppColorButton({
    super.key,
    required this.selectedColor, //3- Requires receipt
    required this.colorController,
    required this.onColorChanged,
    required this.icon,
  });

  final Color selectedColor; //4- Receive
  final TextEditingController colorController;
  final Function(
    Color,
  )
  onColorChanged;
  final Widget icon;

  @override
  State<AppColorButton> createState() => _AppColorButtonState();
}

class _AppColorButtonState extends State<AppColorButton> {
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: IconButton(
        onPressed: () async {
          final selectedColor = await showDialog<Color>(
            context: context,
            builder:
                (
                  context,
                ) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: AppColorWidget(),
                  );
                },
          );
          if (selectedColor != null) {
            widget.onColorChanged(
              selectedColor,
            );
          }
        },
        icon: widget.icon,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
