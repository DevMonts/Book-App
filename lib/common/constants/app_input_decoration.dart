import 'package:flutter/material.dart';

class AppInputDecoration {
  static final inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      //borderSide: BorderSide(width: 6),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      //borderSide: BorderSide(width: 6),
    ),
  );
}
