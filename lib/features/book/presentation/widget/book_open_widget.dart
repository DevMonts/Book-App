import 'package:book_app/features/book/presentation/page/page_page.dart';
import 'package:flutter/material.dart';

class BookOpenWidget extends StatefulWidget {
  final String bookId;
  final String title;
  final String category;
  final Color bookColor;
  final String author;
  final int pages;
  final int numberOfStars;
  final String gender;
  final bool isEbook;
  final String? bookCoverUrl;
  final String icon;
  final String review;
  const BookOpenWidget({
    super.key,
    required this.bookId,
    required this.title,
    required this.category,
    required this.bookColor,
    required this.author,
    required this.pages,
    required this.numberOfStars,
    required this.gender,
    required this.isEbook,
    this.bookCoverUrl,
    required this.icon,
    required this.review,
  });

  @override
  State<BookOpenWidget> createState() => _BookOpenWidgetState();
}

class _BookOpenWidgetState extends State<BookOpenWidget> {
  double width = 330;
  double height = 220;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(
        milliseconds: 300,
      ),
      () {
        setState(() {
          width = 3300;
          height = 2200;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: OverflowBox(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.bookColor,
              width: 7,
            ),
            color: Colors.white,
          ),
          width: width,
          height: height,
          duration: Duration(
            milliseconds: 200,
          ),
          onEnd: () =>
              Navigator.of(
                context,
              ).push(
                PageRouteBuilder(
                  pageBuilder:
                      (
                        context,
                        animation,
                        secondaryAnimation,
                      ) => PagePage(
                        bookId: widget.bookId,
                        title: widget.title,
                        category: widget.category,
                        pages: widget.pages,
                        numberOfStars: widget.numberOfStars,
                        bookColor: widget.bookColor,
                        author: widget.author,
                        gender: widget.gender,
                        isEbook: widget.isEbook,
                        review: widget.review,
                        bookCoverUrl: widget.bookCoverUrl,
                        icon: widget.icon,
                      ),
                  transitionDuration: Duration(
                    seconds: 0,
                  ),
                ),
              ),
          child: Row(
            children: [
              Container(
                color: Colors.grey.shade100,
                width: 20,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
              Container(
                color: Colors.grey.shade100,
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
