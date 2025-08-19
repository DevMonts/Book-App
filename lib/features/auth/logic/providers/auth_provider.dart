//TODO: refactor in validators.dart
import 'package:book_app/common/constants/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;
  AuthProvider() {
    firebaseAuth.authStateChanges().listen((
      User? newUser,
    ) {
      user = newUser;
      notifyListeners();
    });
  }
  Future<void> registerUser(
    String email,
    String password,
  ) async {
    //TODO: exceptions on app_exceptions.dart
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    //TODO: exceptions on app_exceptions.dart
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (firebaseAuth.currentUser != null) {
        Navigator.pushNamed(
          context,
          '/bookcase',
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          const SnackBar(
            content: Text(
              AppStrings.generalError,
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          content: Text(
            AppStrings.generalError,
          ),
        ),
      );
    }
  }
}
