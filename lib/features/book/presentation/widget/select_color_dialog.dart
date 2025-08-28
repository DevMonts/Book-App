import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SelectColorDialog extends StatefulWidget {
  const SelectColorDialog({super.key});

  @override
  State<SelectColorDialog> createState() => _SelectColorDialogState();
}

class _SelectColorDialogState extends State<SelectColorDialog> {
  late Color selectedColor;
  @override
  void initState() {
    super.initState();
    selectedColor = AppColors.larissaGreen;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorPicker(
            pickerColor: selectedColor,
            onColorChanged:
                (
                  color,
                ) {
                  setState(() {
                    selectedColor = color;
                  });
                },
            enableAlpha: false,
          ),
        ],
      ),
      backgroundColor: AppColors.darkWood,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pop(
              selectedColor,
            );
          },
          icon: Icon(
            Icons.draw,
            color: AppColors.paper,
          ),
        ),
      ],
      contentPadding: EdgeInsets.zero,
    );
  }
}
