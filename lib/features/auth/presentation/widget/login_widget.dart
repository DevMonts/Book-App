import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_input_decoration.dart';
import 'package:book_app/common/constants/app_strings.dart';
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
  @override
  Widget build(BuildContext context) {
    return //Scaffold(
    //body: Center(
    //child:
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
          //mainAxisAlignment: MainAxisAlignment.center,
          //spacing: 10,
          children: [
            // SizedBox(
            //   height: 50,
            // ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: AppInputDecoration.inputDecoration.copyWith(
                labelText: AppStrings.email,
                // labelStyle: TextStyle(
                //   color: AppColors.paper,
                // ),
                //border: const OutlineInputBorder(),
              ),
              controller: emailController,
              // style: TextStyle(
              //   color: AppColors.paper,
              // ),
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
                        labelStyle: TextStyle(
                          color: AppColors.paper,
                        ),
                        //border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordViewProvider.obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            // color: passwordViewProvider.obscureText
                            //     ? AppColors.larissaGreen
                            //     : AppColors.paper,
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
                      // style: TextStyle(
                      //   color: passwordViewProvider.obscureText
                      //       ? AppColors.larissaGreen
                      //       : AppColors.paper,
                      // ),
                    );
                  },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  . //center
                  spaceAround,
              children: [
                Expanded(
                  child: //Icon
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.darkWood,
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        // Navigator.pushNamed(
                        //   context,
                        //   '/register',
                        // );
                        context: context,
                        builder:
                            (
                              BuildContext context,
                            ) {
                              return RegisterUserWidget();
                            },
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        isScrollControlled: true,
                      );
                    },
                    child: //Icon
                    Text(
                      // Icons.add,
                      AppStrings.register,
                      style: TextStyle(
                        color: AppColors.paper,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1,
                ),
                Expanded(
                  child: //Icon
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.darkWood,
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
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
                    child: //Icon
                    Text(
                      // Icons.send,
                      AppStrings.login,
                      style: TextStyle(
                        color: AppColors.paper,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
