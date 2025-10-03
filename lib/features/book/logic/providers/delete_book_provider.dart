import 'package:book_app/features/main/presentation/page/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteBookProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isDeleteConfirmed = false;
  Future<void> deleteBookFromFirestore({
    required String bookId,
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
      final confirmed = await showDialog(
        context: context,
        builder:
            (
              context,
            ) {
              return
              //TODO: move to out
              //TODO: redesign delete widget
              AlertDialog(
                title: Text(
                  'Deletar livro?',
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        false,
                      );
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (
                                context,
                              ) => MainPage(
                                initialIndex: 1,
                              ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                ],
              );
            },
      );
      if (confirmed == true) {
        isDeleteConfirmed = true;
        notifyListeners();
        await deleteBookFromFirestore(
          bookId: bookId,
          context: context,
        );
      } else {
        isDeleteConfirmed = false;
        notifyListeners();
      }
    }
  }
}
