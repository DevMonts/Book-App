import 'package:flutter/material.dart';

class AppInputDecoration {
  static final inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        10, //100
      ),
      borderSide: BorderSide(
        //width: 6,
        //color: AppColors.transparent,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        10, //100
      ),
      borderSide: BorderSide(
        //width: 6,
        //color: AppColors.transparent,
      ),
    ),
    //filled: true,
    // fillColor: AppColors.darkWood,
    // labelStyle: TextStyle(
    //   color: AppColors.black,
    // ),
  );
}
