import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return
    // ClipOval(
    //   child: BackdropFilter(
    //     filter: ImageFilter.blur(
    //       sigmaX: 10,
    //       sigmaY: 10,
    //     ),
    //     child:
    SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          //           backgroundColor: AppColors.transparent,
          //           elevation: 0,
        ),
        child: icon,
        //       ),
        //     ),
      ),
    );
  }
}
