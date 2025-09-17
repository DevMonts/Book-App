import 'dart:ui';

import 'package:book_app/common/constants/app_card.dart';
import 'package:book_app/common/constants/app_color_widget.dart';
import 'package:flutter/material.dart';

class AppColorButton extends StatefulWidget {
  final Color selectedColor;
  final TextEditingController colorController;
  final Function(
    Color,
  )
  onColorChanged;

  const AppColorButton({
    super.key,
    required this.selectedColor,
    required this.colorController,
    required this.onColorChanged,
  });

  @override
  State<AppColorButton> createState() => _AppColorButtonState();
}

class _AppColorButtonState extends State<AppColorButton> {
  late Color selectedColor = widget.selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: IconButton(
        onPressed: () async {
          final pickedColor = await showDialog<Color>(
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
          if (pickedColor != null) {
            setState(
              () {
                selectedColor = pickedColor;
                widget.colorController.text =
                    '#${pickedColor.value.toRadixString(
                      16,
                    ).padLeft(
                      8,
                      '0',
                    ).toUpperCase()}';
              },
            );
            widget.onColorChanged(
              pickedColor,
            );
          }
        },
        icon: Icon(
          Icons.palette,
          color: widget.selectedColor,
        ),
      ),
    );
  }
}
