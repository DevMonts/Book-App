import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowBooksProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
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
        .collection('books')
        .orderBy(
          'createdAt',
          descending: true,
        )
        // .limit(
        //   24,
        // )
        .snapshots();
  }
}
