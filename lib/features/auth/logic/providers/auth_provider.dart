import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/core/exceptions/app_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;
  bool isLogged = false;
  String? error;

  AuthProvider() {
    firebaseAuth.authStateChanges().listen((
      User? newUser,
    ) async {
      user = newUser;
      if (newUser != null) {
        isLogged = true;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(
          'isLogged',
          true,
        );
      } else {
        isLogged = false;
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove(
          'isLogged',
        );
      }
      notifyListeners();
    });
  }
  Future<void> registerUser(
    String email,
    String password,
  ) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw AuthFirebaseException.authFirebaseException(e);
    }
  }

  Future<void> loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(
        'isLogged',
        true,
      );
      // if (firebaseAuth.currentUser != null) {
      Navigator.pushReplacementNamed(
        context,
        '/bookcase',
      );
      // } else {
      //   ScaffoldMessenger.of(
      //     context,
      //   ).showSnackBar(
      //     const SnackBar(
      //       content: Text(
      //         AppStrings.generalError,
      //       ),
      //     ),
      //   );
      // }
    } catch (e) {
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       AppStrings.generalError,
      //     ),
      //   ),
      // );
      throw AuthFirebaseException.authFirebaseException(
        e,
      );
    }
  }

  Future<void> logged() async {
    final prefs = await SharedPreferences.getInstance();
    isLogged = prefs.getBool('isLogged') ?? false;
    notifyListeners();
  }
}
