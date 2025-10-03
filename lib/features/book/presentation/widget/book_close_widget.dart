import 'package:book_app/features/book/presentation/widget/book_open_widget.dart';
import 'package:book_app/features/book/repositories/colors_repository.dart';
import 'package:flutter/material.dart';

class BookCloseWidget extends StatelessWidget {
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
  const BookCloseWidget({
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (
                context,
              ) => BookOpenWidget(
                bookId: bookId,
                title: title,
                category: category,
                bookColor: bookColor,
                author: author,
                pages: pages,
                numberOfStars: numberOfStars,
                gender: gender,
                isEbook: isEbook,
                bookCoverUrl: bookCoverUrl,
                icon: icon,
                review: review,
              ),
        ),
      ),
      child: Center(
        child: Container(
          width: 190,
          color: bookColor,
          child: Hero(
            tag: bookId,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (bookCoverUrl == null)
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: (bookColor.computeLuminance() > .5)
                            ? ColorsRepository().browns[13]
                            : ColorsRepository().browns[0],
                      ),
                    ),
                  )
                else
                  Image(
                    image: NetworkImage(
                      bookCoverUrl!,
                    ),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                Container(
                  width: 40,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border(
                      top: BorderSide(
                        color: bookColor,
                        width: 7,
                      ),
                      right: BorderSide(
                        color: bookColor,
                        width: 7,
                      ),
                      bottom: BorderSide(
                        color: bookColor,
                        width: 7,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
