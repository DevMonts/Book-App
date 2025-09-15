import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowBooksProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> showAllBooks() {
    final userId = firebaseAuth.currentUser!.uid;
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('books')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> showFiveStarsBooks() {
    final userId = firebaseAuth.currentUser!.uid;
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('books')
        .where('numberOfStars', isEqualTo: 5)
        .snapshots();
  }

  Stream<QuerySnapshot> showReadingBooks() {
    final userId = firebaseAuth.currentUser!.uid;
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('books')
        .where('isRereading', isEqualTo: false)
        .snapshots();
  }

  Stream<QuerySnapshot> unfinishedBooks() {
    final userId = firebaseAuth.currentUser!.uid;
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('books')
        .where('isFinished', isEqualTo: false)
        .snapshots();
  }

  Stream<QuerySnapshot> finishedBooks() {
    final userId = firebaseAuth.currentUser!.uid;
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('books')
        .where('isFinished', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> wishlistBooks() {
    final userId = firebaseAuth.currentUser!.uid;
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('books')
        .where('isInWishlist', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> rereadingBooks() {
    final userId = firebaseAuth.currentUser!.uid;
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('books')
        .where('isRereading', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> pausedBooks() {
    final userId = firebaseAuth.currentUser!.uid;
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('books')
        .where('isPaused', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> dislikeBooks() {
    final userId = firebaseAuth.currentUser!.uid;
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('books')
        .where('numberOfStars', isEqualTo: 1)
        .snapshots();
  }
}
