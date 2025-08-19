import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterBookProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> sendBookToFirestore({
    //TODO: atualPage
    required pages,
    required publicationDate,
    required title,
    required author,
    required gender,
    required format,
    required synopsis,
  }) async {
    final userId = firebaseAuth.currentUser!.uid;
    await
    //F
    firebaseFirestore //.instance
        .collection(
          'users',
        )
        .doc(userId)
        .collection(
          'books',
        )
        .add({
          'pages': pages,
          'publicationDate': publicationDate,
          'title': title,
          'author': author,
          'gender': gender,
          'format': format,
          'synopsis': synopsis,
        });
  }

  Stream<QuerySnapshot> showBooksFromFirestore() {
    final userId = firebaseAuth.currentUser!.uid;
    return
    //F
    firebaseFirestore //.instance
        .collection(
          'users',
        )
        .doc(
          userId,
        )
        .collection(
          'books',
        )
        .snapshots();
  }
}
