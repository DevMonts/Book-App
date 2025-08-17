import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterBookProvider extends ChangeNotifier {
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
    await FirebaseFirestore.instance.collection('books').add({
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
    return FirebaseFirestore.instance.collection('books').snapshots();
  }
}
