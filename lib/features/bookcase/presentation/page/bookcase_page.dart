import 'dart:ui';

import 'package:book_app/common/constants/app_circle_button.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/common/constants/app_theme.dart';
import 'package:book_app/common/utils/color_converter.dart';
import 'package:book_app/features/bookcase/logic/provider/show_books_provider.dart';
import 'package:book_app/features/details/presentation/page/details_page.dart';
import 'package:book_app/features/register/presentation/widget/register_book_widget.dart';
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
    // final randomColorsProvider = Provider.of<RandomColorsProvider>(
    //   context,
    //   listen: false,
    // );
    return Scaffold(
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
                                        final bookHexColor = book['color'];
                                        final bookColor = //randomColorsProvider
                                            //.randomizeColors();
                                            colorConverter(
                                              bookHexColor,
                                            );
                                        return Hero(
                                          tag: book.id,
                                          child: RotatedBox(
                                            quarterTurns: 3,
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 150,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: bookColor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        15,
                                                      ),
                                                      bottomLeft:
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
                                                  Expanded(
                                                    child: TextButton(
                                                      child: Text(
                                                        book['title'],
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          PageRouteBuilder(
                                                            pageBuilder:
                                                                (
                                                                  _,
                                                                  animation,
                                                                  __,
                                                                ) {
                                                                  return FadeTransition(
                                                                    opacity:
                                                                        animation,
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
                                                                      synopsis:
                                                                          book['synopsis'],
                                                                      // color:
                                                                      //     book['color'],
                                                                      bookColor:
                                                                          bookColor,
                                                                    ),
                                                                  );
                                                                },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColors.brown02,
                                                      borderRadius:
                                                          const BorderRadius.only(
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
                                  color: AppColors.transparent,
                                ),
                                Divider(
                                  thickness: 100,
                                  color: AppColors.transparent,
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
                  backgroundColor: AppColors.transparent,
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
          //TODO: AI
        ],
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
    );
  }
}
