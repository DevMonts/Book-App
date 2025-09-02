import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SynopsisPage extends StatelessWidget {
  final String synopsis;

  const SynopsisPage({
    super.key,
    required this.synopsis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.brown02,
        iconTheme: IconThemeData(
          color: AppColors.violetBlue,
        ),
      ),
      backgroundColor: AppColors.brown02,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Text(
            synopsis,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
