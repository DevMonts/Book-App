import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteBookProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> deleteBookFromFirestore({
    //TODO: confirm message
    required String bookId,
  }) async {
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
  }
}
