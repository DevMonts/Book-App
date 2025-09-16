import 'package:book_app/common/constants/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//TODO: change to repository
class RegisterBookProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> sendBookToFirestore({
    required title,
    required numberOfStars,
    required color,
    required format,
    required isPaused,
    required isRereading,
    required isInWishlist,
    required icon,
    required currentPage,
    required pages,
    required author,
    required gender,
    required review,
  }) async {
    final userId = firebaseAuth.currentUser!.uid;
    final isFinished = (currentPage == pages) ? true : false;
    await firebaseFirestore
        .collection(
          'users',
        )
        .doc(
          userId,
        )
        .collection(
          'books',
        )
        .add(
          {
            'title': title,
            'numberOfStars': numberOfStars,
            'color':
                '#${(color ?? AppColors.brown08).value.toRadixString(16).padLeft(8, '0').toUpperCase()}',
            'format': format,
            'icon': icon,
            'currentPage': currentPage,
            'pages': pages,
            'isFinished': isFinished,
            'isPaused': isPaused,
            'isRereading': isRereading,
            'isInWishlist': isInWishlist,
            'author': author,
            'gender': gender,
            'review': review,
            //TODO: book cover
            'createdAt': FieldValue.serverTimestamp(),
          },
        );
  }
}
