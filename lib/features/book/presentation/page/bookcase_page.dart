import 'dart:ui';

import 'package:book_app/common/constants/app_circle_button.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/common/constants/app_theme.dart';
import 'package:book_app/features/book/logic/provider/random_colors_provider.dart';
import 'package:book_app/features/book/logic/provider/show_books_provider.dart';
import 'package:book_app/features/book/presentation/widget/details_widget.dart';
import 'package:book_app/features/book/presentation/widget/register_book_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookcasePage extends StatefulWidget {
  const BookcasePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<BookcasePage> createState() => _BookcasePageState();
}

class _BookcasePageState extends State<BookcasePage> {
  @override
  Widget build(BuildContext context) {
    final showBooksProvider = Provider.of<ShowBooksProvider>(
      context,
      listen: false,
    );
    final randomColorsProvider = Provider.of<RandomColorsProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      // appBar: AppBar(
      //   title: StreamBuilder<QuerySnapshot>(
      //     stream: showBooksProvider.showBooksFromFirestore(),
      //     builder:
      //         (
      //           context,
      //           snapshot,
      //         ) {
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return const Center(
      //               child: CircularProgressIndicator(),
      //             );
      //           }
      //           if (!snapshot.hasData ||
      //               snapshot
      //                   .data!
      //                   .docs
      //                   .isEmpty // ||
      //           //snapshot.data!.docs.length == 24
      //           ) {
      //             return Text(
      //               '',
      //             );
      //           }
      //           if (snapshot.hasData) {
      //             // final booksCount = snapshot.data!.docs.length;
      //             // return Text(
      //             //   '${AppStrings.bookcase} ($booksCount)',
      //             //   style: TextStyle(
      //             //     color: AppColors.larissaGreen,
      //             //   ),
      //             // );
      //             if (snapshot.data!.docs.length == 1) {
      //               return Center(
      //                 child: Text(
      //                   AppStrings.oneBook,
      //                   style: TextStyle(
      //                     fontSize: 13,
      //                     color: AppColors.larissaGreen,
      //                   ),
      //                 ),
      //               );
      //             }
      //           }
      //           return Center(
      //             child: Text(
      //               '${snapshot.data!.docs.length} livros',
      //               style: TextStyle(
      //                 color: AppColors.larissaGreen,
      //               ),
      //             ),
      //           );
      //         },
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.of(
      //           context,
      //         ).pushNamed(
      //           '/bookList',
      //         );
      //       },
      //       icon: Icon(
      //         Icons.density_small,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return const RegisterBookDialog();
      //           },
      //         );
      //       },
      //       icon: Icon(Icons.add, color: AppColors.larissaGreen),
      //     ),
      //   ],
      //   backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      // ),
      body: StreamBuilder<QuerySnapshot>(
        stream: showBooksProvider.showBooksFromFirestore(),
        builder:
            (
              context,
              snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
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
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Icon(
                    //       Icons.north_east,
                    //       color: AppColors.larissaGreen,
                    //     ),
                    child: Text(
                      AppStrings.empty,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //   color: AppColors.larissaGreen,
                        fontSize: 30,
                      ),
                    ),
                    //   ],
                    // ),
                  ),
                );
              }
              final books = snapshot.data?.docs;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [
                        AppTheme.bookcaseBg(
                          //context,
                          (books!.length / 6).ceil(),
                        ),
                        Center(
                          child: Column(
                            children: [
                              for (
                                int i = 0;
                                i <
                                    books //!
                                        .length;
                                i += 6,
                              ) ...[
                                Wrap(
                                  children: books
                                      .map((
                                        book,
                                      ) {
                                        final bookColor = randomColorsProvider
                                            .randomizeColors();
                                        //TODO: randomize sizes
                                        //TODO: do not randomize with the state
                                        return RotatedBox(
                                          quarterTurns: 3,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 150,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: bookColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                  15,
                                                ),
                                                bottomLeft: Radius.circular(
                                                  15,
                                                ),
                                              ),
                                            ),
                                            margin: EdgeInsetsGeometry.all(
                                              5,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextButton(
                                                    child: Text(
                                                      book['title'],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      //TODO: Book Animation
                                                      showModalBottomSheet(
                                                        context: context,
                                                        builder:
                                                            (
                                                              context,
                                                            ) {
                                                              return BackdropFilter(
                                                                filter:
                                                                    ImageFilter.blur(
                                                                      sigmaX: 5,
                                                                      sigmaY: 5,
                                                                    ),
                                                                child: DetailsWidget(
                                                                  bookId:
                                                                      book.id,
                                                                  title:
                                                                      book['title'],
                                                                  author:
                                                                      book['author'],
                                                                  pages:
                                                                      book['pages'],
                                                                  currentPage:
                                                                      book['currentPage'],
                                                                  // publicationDate:
                                                                  //     book['publicationDate'],
                                                                  gender:
                                                                      book['gender'],
                                                                  format:
                                                                      book['format'],
                                                                  synopsis:
                                                                      book['synopsis'],
                                                                  color:
                                                                      book['color'],
                                                                ),
                                                              );
                                                            },
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        elevation: 0,
                                                        isScrollControlled:
                                                            true,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                // IconButton(
                                                //   onPressed: () {
                                                //     //TODO: favorite books
                                                //   },
                                                //   icon: Icon(
                                                //     Icons.favorite,
                                                //     color: AppColors.wine,
                                                //     size: 10,
                                                //   ),
                                                // ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: AppColors.paper,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                        ),
                                                    border: Border(
                                                      right: BorderSide(
                                                        color: Theme.of(
                                                          context,
                                                        ).scaffoldBackgroundColor,
                                                        width: 7,
                                                      ),
                                                    ),
                                                  ),
                                                  width: 40,
                                                  height: 44,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                                      .toList()
                                      .sublist(
                                        i,
                                        (i + 6 > books.length)
                                            ? books.length
                                            : i + 6,
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
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: AppCircleButton(
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
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AppCircleButton(
              onPressed: () {
                showModalBottomSheet //Dialog
                (
                  context: context,

                  builder:
                      (
                        context,
                      ) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: const RegisterBookWidget(),
                        );
                      },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  isScrollControlled: true,
                );
              },
              icon: Icon(
                Icons.add,
              ),
            ),
            label: '',
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
