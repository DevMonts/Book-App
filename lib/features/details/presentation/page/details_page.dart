import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/features/details/logic/provider/delete_book_provider.dart';

class DetailsPage extends StatelessWidget {
  final String bookId;
  final String title;
  final String author;
  final String pages;
  final String currentPage;
  final String gender;
  final String format;
  final String review;
  final Color bookColor;
  final int numberOfStars;
  const DetailsPage({
    super.key,
    required this.bookId,
    required this.title,
    required this.author,
    required this.pages,
    required this.currentPage,
    required this.gender,
    required this.format,
    required this.review,
    required this.bookColor,
    required this.numberOfStars,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<DeleteBookProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        //TODO: style AppBar
        title: Text(
          title,
        ),
        actions: [
          Container(
            width: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: numberOfStars,
              itemBuilder:
                  (
                    context,
                    index,
                  ) {
                    return Icon(
                      Icons.star,
                      color: Colors.yellow,
                    );
                  },
            ),
          ),
          IconButton(
            onPressed: () async {
              await Provider.of<DeleteBookProvider>(
                context,
                listen: false,
              ).deleteBookFromFirestore(
                context: context,
                bookId: bookId,
                bookColor: bookColor,
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
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Consumer<DeleteBookProvider>(
                builder:
                    (
                      context,
                      deleteBookProvider,
                      child,
                    ) {
                      return Hero(
                        //TODO: fix text formatting on animate
                        tag: bookId,
                        child: Container(
                          width: 300,
                          height: 200,
                          color: bookColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                              bottom: 5,
                            ),
                            child: Container(
                              color: AppColors.brown02,
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  10,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${title.isEmpty ? '' : '$title '}${author.isEmpty ? '' : 'de $author, '}${gender.isEmpty ? '' : 'é do gênero $gender, '}'
                                        '${pages.isEmpty ? ' ' : 'Contem $pages páginas '}${currentPage.isEmpty ? '' : 'e foi lido até a página $currentPage '}${format.isEmpty ? '' : 'no formato $format'}.', //TODO: remain pages
                                        style: TextStyle(
                                          color: AppColors.brown14,
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: AppColors.brown04,
                                    ),
                                    Expanded(
                                      //TODO: text scroll
                                      child: Text(
                                        review,
                                        style: TextStyle(
                                          color: AppColors.brown14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
