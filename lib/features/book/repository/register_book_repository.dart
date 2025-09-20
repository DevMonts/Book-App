import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterBookRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  RegisterBookRepository({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });
  Future<void> sendBookToFirestore({
    //TODO: model

    //9- Requires receipt
    required title,
    required isPaused,
    required isRereading,
    required isEbook,
    required numberOfStars,
    required isInWishlist,
    required color,
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
            //10- Send to Firestore
            'title': title,
            'isPaused': isPaused,
            'isRereading': isRereading,
            'isEbook': isEbook,
            'numberOfStars': numberOfStars,
            'isInWishlist': isInWishlist,
            'color':
                '#${color.value.toRadixString(
                  16,
                ).padLeft(
                  8,
                  '0',
                ).toUpperCase()}',
            'icon': icon,
            'currentPage': currentPage,
            'pages': pages,
            'isFinished': isFinished,
            'author': author,
            'gender': gender,
            'review': review,
            //TODO: book cover
            'createdAt': FieldValue.serverTimestamp(),
          },
        );
  }
}
