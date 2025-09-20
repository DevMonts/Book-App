import 'dart:ui';

import 'package:book_app/common/constants/app_card.dart';
import 'package:book_app/common/constants/app_color_widget.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppColorButton extends StatefulWidget {
  final Color selectedColor; //4- Receive
  final TextEditingController colorController;
  final Function(
    Color,
  )
  onColorChanged;

  const AppColorButton({
    super.key,
    required this.selectedColor, //3- Requires receipt
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
            setState(
              () {
                this.selectedColor = selectedColor;
              },
            );
            widget.onColorChanged(
              selectedColor,
            );
          }
        },
        icon: selectedColor == Colors.transparent
            ?
              //TODO: change to animation
              ShaderMask(
                shaderCallback:
                    (
                      Rect bounds,
                    ) {
                      return LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green,
                          Colors.blue,
                          Colors.indigo,
                          Colors.purple,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.1,
                          0.3,
                          0.4,
                          0.6,
                          0.8,
                          0.9,
                          1.0,
                        ],
                      ).createShader(
                        bounds,
                      );
                    },
                child: Icon(
                  Icons.palette,
                  color: Colors.white,
                ),
              )
            : Icon(
                Icons.palette,
                color: widget.selectedColor,
              ),
      ),
    );
  }
}
