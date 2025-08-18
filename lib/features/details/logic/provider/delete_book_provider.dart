import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteBookProvider extends ChangeNotifier {
  Future<void> deleteBookFromFirestore({required String bookId}) async {
    await FirebaseFirestore.instance
        .collection(
          'books',
        )
        .doc(
          bookId,
        )
        .delete();
  }
}
