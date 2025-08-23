import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/common/constants/app_theme.dart';
import 'package:book_app/features/auth/logic/providers/auth_provider.dart';
import 'package:book_app/features/auth/logic/providers/password_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});
  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //TODO: new theme
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              AppStrings.register,
              style: TextStyle(
                color: AppColors.larissaGreen,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: AppStrings.email,
                labelStyle: TextStyle(
                  color: AppColors.larissaGreen,
                ),
                border: OutlineInputBorder(),
              ),
              controller: emailController,
              style: TextStyle(
                color: AppColors.larissaGreen,
              ),
            ),
            Consumer<PasswordViewProvider>(
              builder:
                  (
                    context,
                    passwordViewProvider,
                    child,
                  ) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: AppStrings.password,
                        labelStyle: TextStyle(
                          color: AppColors.larissaGreen,
                        ),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordViewProvider.obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: passwordViewProvider.obscureText
                                ? AppColors.larissaDarkGreenBook
                                : AppColors.larissaGreen,
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
                      style: TextStyle(
                        color: passwordViewProvider.obscureText
                            ? AppColors.larissaDarkGreenBook
                            : AppColors.larissaGreen,
                      ),
                    );
                  },
            ),
            IconButton(
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
              icon: Icon(
                Icons.send,
                color: AppColors.larissaGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
