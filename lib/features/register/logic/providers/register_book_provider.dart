import 'package:book_app/common/constants/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterBookProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> sendBookToFirestore({
    //TODO: book size
    //TODO: book icon
    required currentPage,
    required pages,
    //required publicationDate,
    required title,
    required author,
    required gender,
    required format,
    required color,
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
          //TODO: book size
          //TODO: book icon
          'currentPage': currentPage,
          'pages': pages,
          //'publicationDate': publicationDate,
          'title': title,
          'author': author,
          'gender': gender,
          'format': format,
          'synopsis': synopsis,
          'color':
              '#${(color ?? AppColors.blackBook).value.toRadixString(
                16,
              ).padLeft(
                8,
                '0',
              ).toUpperCase()}',
          'createdAt': FieldValue.serverTimestamp(),
        });
  }
}
