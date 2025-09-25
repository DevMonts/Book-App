import 'package:book_app/features/book/presentation/widget/book_close_widget.dart';
import 'package:book_app/features/book/presentation/widget/book_open_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/features/book/logic/providers/delete_book_provider.dart';

class DetailsPage extends StatefulWidget {
  final String bookId;
  final String title;
  final String author;
  final int pages;
  final int currentPage;
  final String gender;
  final bool isEbook;
  final String review;
  final Color bookColor;
  final int numberOfStars;
  final String? bookCoverUrl;
  const DetailsPage({
    super.key,
    required this.bookId,
    required this.title,
    required this.author,
    required this.pages,
    required this.currentPage,
    required this.gender,
    required this.isEbook,
    required this.review,
    required this.bookColor,
    required this.numberOfStars,
    required this.bookCoverUrl,
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
      backgroundColor: Colors.black54,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.brown10,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.numberOfStars,
                    (
                      index,
                    ) => const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Provider.of<DeleteBookProvider>(
                      context,
                      listen: false,
                    ).deleteBookFromFirestore(
                      context: context,
                      bookId: widget.bookId,
                      bookColor: widget.bookColor,
                    );
                    Navigator.of(
                      context,
                    ).pop();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Hero(
              tag: widget.bookId,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                child: isOpen == true
                    ? BookOpenWidget(
                        bookColor: widget.bookColor,
                        title: widget.title,
                        author: widget.author,
                        pages: widget.pages,
                        currentPage: widget.currentPage,
                        gender: widget.gender,
                        isEbook: widget.isEbook,
                        review: widget.review,
                        bookCoverUrl: widget.bookCoverUrl,
                    )
                    : BookCloseWidget(
                        bookColor: widget.bookColor,
                        title: widget.title,
                        bookCoverUrl: widget.bookCoverUrl,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
