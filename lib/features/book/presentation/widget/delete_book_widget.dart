import 'package:book_app/features/main/presentation/page/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteBookWidget extends StatelessWidget {
  final String bookId;
  const DeleteBookWidget({
    super.key,
    required this.bookId,
  });

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return
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
  }
}
