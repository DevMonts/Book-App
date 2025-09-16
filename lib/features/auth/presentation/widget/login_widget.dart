import 'package:book_app/common/constants/app_text_form_field.dart';
import 'package:book_app/features/auth/logic/providers/password_view_provider.dart';
import 'package:book_app/features/auth/presentation/widget/register_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_app/features/auth/logic/providers/auth_provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? error;
  @override
  Widget build(BuildContext context) {
    return //Scaffold(
    //body: Center(
    //child:
    Padding(
      padding:
          EdgeInsets. //all
          only(
            right: 50,
            left: 50,
            top: 50,
            bottom: MediaQuery.of(
              context,
            ).viewInsets.bottom,
          ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppTextFormField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
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
                    return AppTextFormField(
                      hintText: 'Senha',
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
                      obscureText: passwordViewProvider.obscureText,
                      controller: passwordController,
                    );
                  },
            ),
            SizedBox(
              height: 10,
            ),
            (error != null)
                ? Text(
                    error!,
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (
                              context,
                            ) {
                              return RegisterUserWidget();
                            },
                        isScrollControlled: true,
                      );
                    },
                    child: Text(
                      'Cadastrar',
                    ),
                  ),
                ),
                SizedBox(
                  width: 1,
                ),
                Expanded(
                  child: ElevatedButton(
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
                        if (!mounted) return;
                        setState(() {
                          error = e.toString();
                        });
                        Future.delayed(
                          const Duration(
                            seconds: 3,
                          ),
                          () {
                            setState(() {
                              error = null;
                            });
                          },
                        );
                      }
                    },
                    child: Text(
                      'Login',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
