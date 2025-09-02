import 'package:book_app/common/constants/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteBookProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isDeleteConfirmed = false;
  Future<void> deleteBookFromFirestore({
    required String bookId,
    required Color bookColor,
    required BuildContext context,
  }) async {
    if (isDeleteConfirmed) {
      final userId = firebaseAuth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection(
            'users',
          )
          .doc(
            userId,
          )
          .collection(
            'books',
          )
          .doc(
            bookId,
          )
          .delete();
      isDeleteConfirmed = false;
      notifyListeners();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text(
      //       AppStrings.deleteConfirmation,
      //     ),
      //   ),
      // );
      final confirmed = await showModalBottomSheet(
        backgroundColor: AppColors.transparent,
        context: context,
        builder:
            (
              context,
            ) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.transparent,
                      bookColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.transparent,
                  ),
                  onPressed: () async {
                    final userId = firebaseAuth.currentUser!.uid;
                    await FirebaseFirestore.instance
                        .collection(
                          'users',
                        )
                        .doc(
                          userId,
                        )
                        .collection(
                          'books',
                        )
                        .doc(
                          bookId,
                        )
                        .delete();
                    // deleteBookFromFirestore(
                    //   bookId: bookId,
                    //   context: context,
                    //   bookColor: bookColor,
                    // );
                    Navigator.pushNamed(
                      context,
                      '/bookcase',
                    );
                  },
                  child: Icon(
                    Icons.delete,
                    size: 50,
                    color: AppColors.red,
                  ),
                ),
              );
            },
      );
      if (confirmed == true) {
        isDeleteConfirmed = true;
        notifyListeners();
        await deleteBookFromFirestore(
          bookId: bookId,
          bookColor: bookColor,
          context: context,
        );
      } else {
        isDeleteConfirmed = false;
        notifyListeners();
      }
    }
  }
}
