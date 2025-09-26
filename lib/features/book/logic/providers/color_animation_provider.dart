import 'dart:async';

import 'package:book_app/features/book/repositories/colors_repository.dart';
import 'package:flutter/material.dart';

class ColorAnimationProvider extends ChangeNotifier {
  final colorRepository = ColorsRepository();
  int colorIndex = 0;
  late Timer timer;
  Color animatedColor = Colors.red;

  void start() {
    timer = Timer.periodic(
      Duration(
        seconds: 1,
      ),
      (
        _,
      ) {
        colorIndex = (colorIndex + 1) % colorRepository.rainbow.length;
        animatedColor = colorRepository.rainbow[colorIndex];
        notifyListeners();
      },
    );
  }

  void stop() {
    timer.cancel();
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
