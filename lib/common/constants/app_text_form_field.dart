import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLines;
  final double? height;

  const AppTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          Text(
            hintText!,
          ),
          SizedBox(
            height: height,

            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: BorderSide.none,
                ),

                filled: true,
              ),

              controller: controller,

              maxLines: maxLines,
            ),
          ),
        ],
      ),
    );
  }
}
