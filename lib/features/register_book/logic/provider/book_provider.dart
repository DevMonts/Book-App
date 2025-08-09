import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  Future<void> sendBookToFirestore({
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
      'bookFormat': format,
      'synopsis': synopsis,
    });
  }
}
