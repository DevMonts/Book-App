import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_input_decoration.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/auth/logic/providers/auth_provider.dart';
import 'package:book_app/features/auth/logic/providers/password_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUserWidget extends StatefulWidget {
  const RegisterUserWidget({super.key});
  @override
  State<RegisterUserWidget> createState() => _RegisterUserWidgetState();
}

class _RegisterUserWidgetState extends State<RegisterUserWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return //Scaffold(
    // appBar: AppBar(
    //   backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    // ),
    //body:
    Padding(
      padding:
          EdgeInsets. //all
          only(
            //50
            bottom: MediaQuery.of(
              context,
            ).viewInsets.bottom,
          ),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // spacing: 10,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: AppInputDecoration.inputDecoration.copyWith(
                labelText: AppStrings.email,
                // border: OutlineInputBorder(),
              ),
              controller: emailController,
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<PasswordViewProvider>(
              builder:
                  (
                    context,
                    passwordViewProvider,
                    child,
                  ) {
                    return TextFormField(
                      decoration: AppInputDecoration.inputDecoration.copyWith(
                        labelText: AppStrings.password,
                        //border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordViewProvider.obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            Provider.of<PasswordViewProvider>(
                              context,
                              listen: false,
                            ).changePasswordViewer();
                          },
                        ),
                      ),
                      obscureText: passwordViewProvider.obscureText,
                      controller: passwordController,
                    );
                  },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.pink,
                minimumSize: const Size(
                  double.infinity,
                  50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                final authProvider = Provider.of<AuthProvider>(
                  context,
                  listen: false,
                );
                authProvider.registerUser(
                  email,
                  password,
                );
                Navigator.pushNamed(
                  context,
                  '/',
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppStrings.success,
                    ),
                  ),
                );
              },
              child: //Icon
              Text(
                //Icons.send,
                AppStrings.register,
                style: TextStyle(
                  color: AppColors.violetBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
