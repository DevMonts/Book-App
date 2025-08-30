import 'dart:ui';

import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/auth/presentation/widget/login_widget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.title,
              style: TextStyle(
                fontSize: 100,
              ),
            ),
            Text(
              AppStrings.description,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.transparent,
                  elevation: 0,
                  isScrollControlled: true,
                  builder:
                      (
                        context,
                      ) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: const LoginWidget(),
                        );
                      },
                );
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
              ),
              child: Icon(
                Icons.play_arrow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
