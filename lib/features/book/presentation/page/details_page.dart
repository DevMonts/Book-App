import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/features/book/logic/providers/delete_book_provider.dart';

class DetailsPage extends StatelessWidget {
  final String bookId;
  final String title;
  final String author;
  final int pages;
  final int currentPage;
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
      backgroundColor: Colors.black54,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    numberOfStars,
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
            Consumer<DeleteBookProvider>(
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
                                      //O livro/ebook tal, de Fulano é do gênero tal. Contêm x páginas e dessas, você leu y.
                                      'O ${(format == 'ebook') ? 'ebook' : 'livro'} $title, ${author.isEmpty ? '' : 'de $author, '}${gender.isEmpty ? '' : 'é do gênero $gender'}. Contêm $pages páginas e dessas, você leu $currentPage. Faltam',
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
          ],
        ),
      ),
    );
  }
}
