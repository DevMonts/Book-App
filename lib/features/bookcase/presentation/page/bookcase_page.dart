import 'dart:ui';

import 'package:book_app/common/constants/app_button.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/common/constants/app_theme.dart';
import 'package:book_app/common/utils/color_converter.dart';
import 'package:book_app/common/utils/icons_converter.dart';
import 'package:book_app/features/bookcase/logic/provider/show_books_provider.dart';
import 'package:book_app/features/details/presentation/page/details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO: other bookcases
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
    // final randomColorsProvider = Provider.of<RandomColorsProvider>(
    //   context,
    //   listen: false,
    // );
    return Scaffold(
      //TODO: componentize bookcase

      // appBar: AppBar(
      //   backgroundColor: Theme.of(
      //     context,
      //   ).scaffoldBackgroundColor,
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
                    child: Text(
                      AppStrings.empty,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                );
              }
              final books = snapshot
                  .data //?
                  !
                  .docs;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [
                        AppTheme.bookcaseBg(
                          context,
                          (books //!
                                      .length /
                                  5)
                              .ceil(),
                        ),
                        Center(
                          child: Column(
                            children: [
                              for (
                                int i = 0;
                                i <
                                    books //!
                                        .length;
                                i += 5,
                              ) ...[
                                Wrap(
                                  children: books
                                      .map((
                                        book,
                                      ) {
                                        final bookHexColor = book['color'];
                                        final bookColor = //randomColorsProvider
                                            //.randomizeColors();
                                            colorConverter(
                                              bookHexColor,
                                            );
                                        return Hero(
                                          tag: book.id,
                                          child: RotatedBox(
                                            quarterTurns: 1,
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 200,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: bookColor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topRight: Radius.circular(
                                                        15,
                                                      ),
                                                      bottomRight:
                                                          Radius.circular(
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
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                  10,
                                                                ),
                                                            bottomRight:
                                                                Radius.circular(
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
                                                            child: Icon(
                                                              IconsConverter.getIconFromString(
                                                                book['icon']
                                                                    as String,
                                                              ),
                                                              color: (() {
                                                                switch (book['icon']
                                                                    as String) {
                                                                  case 'ac_unit':
                                                                    return Colors
                                                                        .cyanAccent;

                                                                  case 'anchor':
                                                                    return Colors
                                                                        .grey;

                                                                  case 'brightness_3':
                                                                    return Colors
                                                                        .yellow;

                                                                  case 'church':
                                                                    return Colors
                                                                        .white;

                                                                  case 'cloud':
                                                                    return Colors
                                                                        .white;

                                                                  case 'cottage':
                                                                    return Colors
                                                                        .orange;

                                                                  case 'deck':
                                                                    return Colors
                                                                        .brown;

                                                                  case 'delete':
                                                                    return Colors
                                                                        .grey;

                                                                  case 'electric_bolt':
                                                                    return Colors
                                                                        .yellow;

                                                                  case 'explore':
                                                                    return Colors
                                                                        .grey;

                                                                  case 'favorite':
                                                                    return Colors
                                                                        .red;

                                                                  case 'heart_broken':
                                                                    return Colors
                                                                        .red;

                                                                  case 'local_fire_department':
                                                                    return Colors
                                                                        .orange;

                                                                  case 'local_florist':
                                                                    return Colors
                                                                        .pink;

                                                                  case 'local_pizza':
                                                                    return Colors
                                                                        .yellow;

                                                                  case 'sunny':
                                                                    return Colors
                                                                        .yellow;

                                                                  default:
                                                                    return null;
                                                                }
                                                              })(),
                                                            ),
                                                          ),
                                                          VerticalDivider(
                                                            color: AppColors
                                                                .brown14,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              book['title'],
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                          VerticalDivider(
                                                            color: AppColors
                                                                .brown14,
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
                                                                    opacity:
                                                                        animation,
                                                                    child: BackdropFilter(
                                                                      filter: ImageFilter.blur(
                                                                        sigmaX:
                                                                            5,
                                                                        sigmaY:
                                                                            5,
                                                                      ),
                                                                      child: DetailsPage(
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
                                                                        gender:
                                                                            book['gender'],
                                                                        format:
                                                                            book['format'],
                                                                        review:
                                                                            book['review'],
                                                                        bookColor:
                                                                            bookColor,
                                                                        numberOfStars:
                                                                            book['numberOfStars'],
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
                                      })
                                      .toList()
                                      .sublist(
                                        i,
                                        (i + 5 > books.length)
                                            ? books.length
                                            : i + 5,
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
      bottomNavigationBar:
          //TODO: refactor
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: AppButton(
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
                icon: AppButton(
                  onPressed: () {
                    // showModalBottomSheet //Dialog
                    Navigator.of(
                      context,
                    ).pushNamed(
                      '/register',
                    );
                    // (
                    //   context: context,

                    //   builder:
                    //       (
                    //         context,
                    //       ) {
                    //         return BackdropFilter(
                    //           filter: ImageFilter.blur(
                    //             sigmaX: 5,
                    //             sigmaY: 5,
                    //           ),
                    //           child: const RegisterBookWidget(),
                    //         );
                    //       },
                    //   backgroundColor: AppColors.transparent,
                    //   elevation: 0,
                    //   isScrollControlled: true,
                    // );
                  },
                  icon: Icon(
                    Icons.add,
                  ),
                ),
                label: '',
              ),
              //TODO: search
              //TODO: AI
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
    );
  }
}
