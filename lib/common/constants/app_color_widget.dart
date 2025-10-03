import 'package:book_app/features/book/repositories/colors_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppColorWidget extends StatefulWidget {
  const AppColorWidget({
    super.key,
  });

  @override
  State<AppColorWidget> createState() => _AppColorWidgetState();
}

class _AppColorWidgetState extends State<AppColorWidget> {
  late Color selectedColor;
  @override
  void initState() {
    super.initState();
    selectedColor = ColorsRepository().browns[7];
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
