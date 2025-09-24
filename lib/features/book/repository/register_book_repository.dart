import 'package:book_app/features/book/data/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterBookRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  RegisterBookRepository({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });
  Future<void> sendBookToFirestore(
    BookModel bookModel, //9- Receipt the model
  ) async {
    final userId = firebaseAuth.currentUser!.uid;
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
          bookModel.toMap(), //10- Send to Firestore
        );
  }
}
