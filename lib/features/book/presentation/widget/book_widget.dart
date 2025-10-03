import 'package:book_app/features/book/presentation/widget/book_icon_widget.dart';
import 'package:book_app/features/book/presentation/page/details_page.dart';
import 'package:book_app/features/book/repositories/colors_repository.dart';
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
  bool isLoading = false;
  bool isClickable = true;
  @override
  Widget build(BuildContext context) {
    return
    //TODO: redesign
    Hero(
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
                  color: Colors.grey.shade100,
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
                  onPressed: isClickable
                      ? () async {
                          setState(
                            () {
                              isLoading = true;
                              isClickable = false;
                            },
                          );
                          final String? bookCover = widget.book['bookCoverUrl'];
                          if (bookCover != null) {
                            await precacheImage(
                              NetworkImage(
                                bookCover,
                              ),
                              context,
                            );
                          }
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
                                      child: DetailsPage(
                                        bookId: widget.book.id,
                                        title: widget.book['title'],
                                        category: widget.book['category'],
                                        pages: widget.book['pages'],
                                        numberOfStars:
                                            widget.book['numberOfStars'],
                                        bookColor: widget.bookColor,
                                        author: widget.book['author'],
                                        gender: widget.book['gender'],
                                        isEbook: widget.book['isEbook'],
                                        bookCoverUrl:
                                            widget.book['bookCoverUrl'],
                                        icon: widget.book['icon'],
                                        review: widget.book['review'],
                                      ),
                                    );
                                  },
                            ),
                          );
                          setState(
                            () {
                              isLoading = false;
                              isClickable = true;
                            },
                          );
                        }
                      : null,
                  child: Row(
                    children: [
                      isLoading
                          ? const Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : RotatedBox(
                              quarterTurns: 3,
                              child: BookIconWidget(
                                book: widget.book,
                              ),
                            ),
                      VerticalDivider(
                        color: ColorsRepository().browns[13],
                      ),
                      Expanded(
                        child: Text(
                          widget.book['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: (widget.bookColor.computeLuminance() > .5)
                                ? ColorsRepository().browns[13]
                                : ColorsRepository().browns[0],
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: ColorsRepository().browns[13],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
