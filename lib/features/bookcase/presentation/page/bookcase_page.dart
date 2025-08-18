import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/common/constants/app_theme.dart';
import 'package:book_app/features/bookcase/logic/provider/bookcase_provider.dart';
import 'package:book_app/features/details/presentation/widget/details_dialog.dart';
import 'package:book_app/features/register_book/logic/provider/register_book_provider.dart';
import 'package:book_app/features/register_book/presentation/widget/register_book_dialog.dart';
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
    final registerBookProvider = Provider.of<RegisterBookProvider>(
      context,
      listen: false,
    );
    final bookcaseProvider = Provider.of<BookcaseProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const RegisterBookDialog();
                },
              );
            },
            icon: Icon(Icons.add, color: AppColors.larissaGreen),
          ),
        ],
        backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: registerBookProvider.showBooksFromFirestore(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Padding(
              padding: const EdgeInsetsGeometry.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.north_east, color: AppColors.larissaGreen),
                  Text(
                    AppStrings.empty,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.larissaGreen),
                  ),
                ],
              ),
            );
          }
          final books = snapshot.data?.docs;
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  for (int i = 0; i < books!.length; i += 6) ...[
                    Wrap(
                      children: books
                          .map((book) {
                            final bookColor = bookcaseProvider
                                .randomizeColors();
                            return RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                alignment: Alignment.center,
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(color: bookColor),
                                margin: EdgeInsetsGeometry.all(5),
                                child: TextButton(
                                  child: Text(
                                    book['title'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    //TODO: Book Animation
                                    showDialog(
                                      context: context,
                                      builder:
                                          (
                                            BuildContext context,
                                          ) {
                                            return DetailsDialog(
                                              title: book['title'],
                                              author: book['author'],
                                              pages: book['pages'],
                                              publicationDate:
                                                  book['publicationDate'],
                                              gender: book['gender'],
                                              format: book['format'],
                                              synopsis: book['synopsis'],
                                            );
                                          },
                                    );
                                  },
                                ),
                              ),
                            );
                          })
                          .toList()
                          .sublist(
                            i,
                            (i + 6 > books.length) ? books.length : i + 6,
                          ),
                    ),
                    Divider(color: AppColors.middleWood, thickness: 30),
                  ],
                ],
              ),
            ),
          );
        },
      ),
      // bottomNavigationBar: Container(
      //   child: BottomNavigationBar(
      //     items: const [
      //       BottomNavigationBarItem(icon: Icon(null), label: ''),
      //       BottomNavigationBarItem(icon: Icon(null), label: ''),
      //     ],
      //     backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      //   ),
      //   decoration: BoxDecoration(border: Border(top: BorderSide(width: 6))),
      // ),
    );
  }
}
