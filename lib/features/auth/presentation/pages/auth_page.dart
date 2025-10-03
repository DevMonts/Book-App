import 'dart:ui';

import 'package:book_app/features/auth/presentation/widget/login_widget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: redesign
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bookle',
              style: TextStyle(
                fontSize: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 200,
        ),
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              //backgroundColor: AppColors.transparent,
              elevation: 0,
              isScrollControlled: true,
              builder:
                  (
                    context,
                  ) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(
                        // sigmaX: 5,
                        // sigmaY: 5,
                      ),
                      child: const LoginWidget(),
                    );
                  },
            );
          },
          child: Icon(
            Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
