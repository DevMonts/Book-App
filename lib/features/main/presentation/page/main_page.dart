import 'package:book_app/features/book/presentation/page/register_book_page.dart';
import 'package:book_app/features/book/repositories/register_book_repository.dart';
import 'package:book_app/features/bookcase/presentation/page/bookcase_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;
  const MainPage({
    super.key,
    required this.initialIndex,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: widget.initialIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        RegisterBookPage(
          pageController: pageController,
          registerBookRepository: RegisterBookRepository(
            firebaseAuth: FirebaseAuth.instance,
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        BookcasePage(
          pageController: pageController,
        ),
      ],
    );
  }
}
