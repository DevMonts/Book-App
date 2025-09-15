import 'dart:ui';

import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/features/book/presentation/widget/book_icon_widget.dart';
import 'package:book_app/features/book/presentation/page/details_page.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatefulWidget {
  final dynamic book;
  final Color bookColor;
  const BookWidget({
    super.key,
    required this.book,
    required this.bookColor,
  });

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.book.id,
      child: RotatedBox(
        quarterTurns: 1,
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: widget.bookColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(
                15,
              ),
              bottomRight: Radius.circular(
                15,
              ),
            ),
          ),
          margin: const EdgeInsets.all(
            5,
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.brown02,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(
                      10,
                    ),
                    bottomRight: Radius.circular(
                      10,
                    ),
                  ),
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      width: 7,
                    ),
                  ),
                ),
                width: 50,
                height: 50,
              ),
              Expanded(
                child: TextButton(
                  child: Row(
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: BookIconWidget(
                          book: widget.book,
                        ),
                      ),
                      VerticalDivider(
                        color: AppColors.brown14,
                      ),
                      Expanded(
                        child: Text(
                          widget.book['title'],
                          textAlign: TextAlign.center,
                          //TODO: title color
                        ),
                      ),
                      VerticalDivider(
                        color: AppColors.brown14,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        opaque: false,
                        pageBuilder:
                            (
                              _,
                              animation,
                              __,
                            ) {
                              return FadeTransition(
                                opacity: animation,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5,
                                    sigmaY: 5,
                                  ),
                                  child: DetailsPage(
                                    bookId: widget.book.id,
                                    title: widget.book['title'],
                                    author: widget.book['author'],
                                    pages: widget.book['pages'],
                                    currentPage: widget.book['currentPage'],
                                    gender: widget.book['gender'],
                                    format: widget.book['format'],
                                    review: widget.book['review'],
                                    bookColor: widget.bookColor,
                                    numberOfStars: widget.book['numberOfStars'],
                                  ),
                                ),
                              );
                            },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
