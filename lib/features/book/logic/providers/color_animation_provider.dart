import 'dart:async';

import 'package:flutter/material.dart';

class ColorAnimationProvider extends ChangeNotifier {
  List<Color> rainbow = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
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
        colorIndex = (colorIndex + 1) % rainbow.length;
        animatedColor = rainbow[colorIndex];
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
