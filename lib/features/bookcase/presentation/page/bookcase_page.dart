import 'package:book_app/common/constants/app_theme.dart';
import 'package:book_app/common/utils/color_converter.dart';
import 'package:book_app/features/book/presentation/widget/book_widget.dart';
import 'package:book_app/features/bookcase/logic/provider/navigation_provider.dart';
import 'package:book_app/features/bookcase/logic/provider/show_books_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';

class BookcasePage extends StatefulWidget {
  final PageController pageController;
  const BookcasePage({
    super.key,
    required this.pageController,
  });
  @override
  State<BookcasePage> createState() => _BookcasePageState();
}

class _BookcasePageState extends State<BookcasePage> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(
      context,
    );
    final showBooksProvider = Provider.of<ShowBooksProvider>(
      context,
    );

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            //TODO: avatar
            //TODO: avatar history
            //TODO: style destinations
            //TODO: order by color
            leading: IconButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed(
                  '/login',
                );
              },
              icon: Icon(
                Icons.logout,
              ),
            ),
            extended: false,
            destinations: [
              NavigationRailDestination(
                icon: Icon(
                  Icons.all_inclusive,
                ),
                label: Text(
                  'Todos',
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.star,
                ),
                label: Column(
                  children: [
                    Text(
                      '5',
                    ),
                    Text(
                      'Estrelas',
                    ),
                  ],
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.play_arrow,
                ),
                label: Text(
                  'Lendo',
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.playlist_remove,
                ),
                label: Column(
                  children: [
                    Text(
                      'Não',
                    ),
                    Text(
                      'Finalizados',
                    ),
                  ],
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.playlist_add_check,
                ),
                label: Text(
                  'Finalizados',
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: Text(
                  'Wishlist',
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.replay,
                ),
                label: Text(
                  'Relendo',
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.pause,
                ),
                label: Text(
                  'Pausado',
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.thumb_down,
                ),
                label: Column(
                  children: [
                    Text(
                      'Não',
                    ),
                    Text(
                      'Gostei',
                    ),
                  ],
                ),
              ),
            ],
            selectedIndex: navigationProvider.currentIndex,
            onDestinationSelected:
                (
                  index,
                ) {
                  navigationProvider.changeBookcase(
                    index,
                  );
                },
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
            minWidth: 1,
          ),
          Expanded(
            child: PageView(
              controller: navigationProvider.pageController,
              onPageChanged:
                  (
                    index,
                  ) {
                    navigationProvider.changeBookcase(
                      index,
                    );
                  },
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: switch (navigationProvider.currentIndex) {
                    0 => showBooksProvider.showAllBooks(),
                    1 => showBooksProvider.showFiveStarsBooks(),
                    2 => showBooksProvider.showReadingBooks(),
                    3 => showBooksProvider.unfinishedBooks(),
                    4 => showBooksProvider.finishedBooks(),
                    5 => showBooksProvider.wishlistBooks(),
                    6 => showBooksProvider.rereadingBooks(),
                    7 => showBooksProvider.pausedBooks(),
                    8 => showBooksProvider.dislikeBooks(),
                    _ => null,
                  },
                  builder:
                      (
                        context,
                        snapshot,
                      ) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Padding(
                            padding: const EdgeInsetsGeometry.all(
                              10,
                            ),
                            child: Center(
                              child: Text(
                                'Clique no ícone + para adicionar um livro na sua estante',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          );
                        }
                        final books = snapshot.data!.docs;
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Stack(
                                children: [
                                  AppTheme.bookcaseBg(
                                    context,
                                    (books.length / 4).ceil(),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        for (
                                          int i = 0;
                                          i < books.length;
                                          i += 4,
                                        ) ...[
                                          Wrap(
                                            children: books
                                                .map((
                                                  book,
                                                ) {
                                                  final bookHexColor =
                                                      book['color'];
                                                  final bookColor =
                                                      colorConverter(
                                                        bookHexColor,
                                                      );
                                                  return BookWidget(
                                                    book: book,
                                                    bookColor: bookColor,
                                                  );
                                                })
                                                .toList()
                                                .sublist(
                                                  i,
                                                  (i + 4 > books.length)
                                                      ? books.length
                                                      : i + 4,
                                                ),
                                          ),
                                          Divider(
                                            thickness: 100,
                                            color: Colors.transparent,
                                          ),
                                          Divider(
                                            thickness: 100,
                                            color: Colors.transparent,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                ),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.pageController.animateToPage(
            0,
            duration: Duration(
              milliseconds: 300,
            ),
            curve: Curves.linear,
          );
        },
        mini: true,
        child: Icon(
          Icons.add,
        ),
      ),
      //TODO: search
      //TODO: AI
    );
  }
}
