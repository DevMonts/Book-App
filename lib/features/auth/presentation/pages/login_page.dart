import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/auth/logic/providers/password_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_app/features/auth/logic/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                AppStrings.title,
                style: TextStyle(
                  fontSize: 100,
                  color: AppColors.larissaGreen,
                ),
              ),
              Text(
                AppStrings.description,
                style: TextStyle(
                  color: AppColors.larissaGreen,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: AppStrings.email,
                  labelStyle: TextStyle(
                    color: AppColors.larissaGreen,
                  ),
                  border: const OutlineInputBorder(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/register',
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      color: AppColors.larissaGreen,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final authProvider = Provider.of<AuthProvider>(
                        context,
                        listen: false,
                      );
                      try {
                        await authProvider.loginUser(
                          context,
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text(
                              e.toString(),
                            ),
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: AppColors.larissaGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
