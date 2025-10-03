import 'package:book_app/features/book/presentation/widget/book_close_widget.dart';
import 'package:book_app/features/book/repositories/colors_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_app/features/book/logic/providers/delete_book_provider.dart';

class DetailsPage extends StatefulWidget {
  final String bookId;
  final String title;
  final String category;
  final int pages;
  final int numberOfStars;
  final Color bookColor;
  final String author;
  final String gender;
  final bool isEbook;
  final String? bookCoverUrl;
  final String icon;
  final String review;
  const DetailsPage({
    super.key,
    required this.bookId,
    required this.title,
    required this.category,
    required this.pages,
    required this.numberOfStars,
    required this.bookColor,
    required this.author,
    required this.gender,
    required this.isEbook,
    required this.bookCoverUrl,
    required this.icon,
    required this.review,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    Provider.of<DeleteBookProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: ColorsRepository().browns[0],
            size: 50,
          ),
          onPressed: () {
            Navigator.of(
              context,
            ).pop();
          },
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          child: BookCloseWidget(
            bookId: widget.bookId,
            title: widget.title,
            category: widget.category,
            pages: widget.pages,
            numberOfStars: widget.numberOfStars,
            bookColor: widget.bookColor,
            author: widget.author,
            gender: widget.gender,
            isEbook: widget.isEbook,
            bookCoverUrl: widget.bookCoverUrl,
            icon: widget.icon,
            review: widget.review,
          ),
        ),
      ),
    );
  }
}
