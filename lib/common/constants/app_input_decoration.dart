import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppInputDecoration {
  static final inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        100, //10
      ),
      borderSide: BorderSide(
        //width: 6
        color: AppColors.transparent,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        100, //10
      ),
      borderSide: BorderSide(
        //width: 6
        color: AppColors.transparent,
      ),
    ),
    filled: true,
    // fillColor: AppColors.darkWood,
    // labelStyle: TextStyle(
    //   color: AppColors.paper,
    // ),
  );
}
