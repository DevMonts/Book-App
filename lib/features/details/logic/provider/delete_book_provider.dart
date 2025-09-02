import 'package:book_app/common/constants/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteBookProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isDeleteConfirmed = false;
  Future<void> deleteBookFromFirestore({
    required String bookId,
    required BuildContext context,
  }) async {
    if (isDeleteConfirmed) {
      final userId = firebaseAuth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection(
            'users',
          )
          .doc(
            userId,
          )
          .collection(
            'books',
          )
          .doc(
            bookId,
          )
          .delete();
      isDeleteConfirmed = false;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            AppStrings.deleteConfirmation,
          ),
        ),
      );
      isDeleteConfirmed = true;
      notifyListeners();
    }
  }
}
