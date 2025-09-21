import 'dart:async';
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
  final List rainbow = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  Color animatedColor = Colors.red;
  int colorIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.selectedColor;
    if (selectedColor == AppColors.brown08) colorAnimation();
  }

  void colorAnimation() {
    timer = Timer.periodic(
      Duration(
        seconds: 1,
      ),
      (
        timer,
      ) {
        setState(
          () {
            colorIndex = (colorIndex + 1) % rainbow.length;
            animatedColor = rainbow[colorIndex];
          },
        );
      },
    );
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
                timer?.cancel();
              },
            );
            widget.onColorChanged(
              selectedColor,
            );
          }
        },
        icon: selectedColor == AppColors.brown08
            ? AnimatedSwitcher(
                duration: Duration(
                  seconds: 1,
                ),
                child: Icon(
                  Icons.palette,
                  key: ValueKey(
                    animatedColor,
                  ),
                  color: animatedColor,
                ),
              )
            : Icon(
                Icons.palette,
                color: widget.selectedColor,
              ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
