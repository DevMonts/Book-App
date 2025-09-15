import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

//TODO: rename class
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
    selectedColor = AppColors.brown07;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SlidePicker(
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
            displayThumbColor: true,
            indicatorBorderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pop();
          },
          icon: Icon(
            Icons.close,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pop(
              selectedColor,
            );
          },
          icon: Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      ],
      contentPadding: EdgeInsets.zero,
    );
  }
}
