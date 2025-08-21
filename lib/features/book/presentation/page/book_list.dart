import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/book/logic/provider/delete_book_provider.dart';
import 'package:book_app/features/book/logic/provider/show_books_provider.dart';
import 'package:book_app/features/book/presentation/widget/details_dialog.dart';
import 'package:book_app/features/book/presentation/widget/register_book_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});
  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    final showBooksProvider = Provider.of<ShowBooksProvider>(
      context,
      listen: false,
    );
    final deleteBookProvider = Provider.of<DeleteBookProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<QuerySnapshot>(
          stream: showBooksProvider.showBooksFromFirestore(),
          builder:
              (
                context,
                snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.docs.length == 1) {
                  return Center(
                    child: Text(
                      AppStrings.oneBook,
                    ),
                  );
                }
                final booksCount = snapshot.data?.docs.length ?? 0;
                return Center(
                  child: Text(
                    ' ${booksCount} Livros',
                  ),
                );
              },
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (
                      BuildContext context,
                    ) {
                      return const RegisterBookDialog();
                    },
              );
            },
            icon: Icon(
              Icons.add,
              color: AppColors.larissaGreen,
            ),
          ),
        ],
      ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.north_east,
                        color: AppColors.larissaGreen,
                      ),
                      Text(
                        AppStrings.empty,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.larissaGreen,
                        ),
                      ),
                    ],
                  ),
                );
              }
              final books = snapshot.data?.docs;
              return ListView.builder(
                itemCount: books?.length,
                itemBuilder:
                    (
                      context,
                      index,
                    ) {
                      final book = books![index];
                      final title = book['title'];
                      final author = book['author'];
                      return Card(
                        child: ListTile(
                          title: Text(
                            title,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              deleteBookProvider.deleteBookFromFirestore(
                                bookId: book.id,
                                context: context,
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: AppColors.wine,
                            ),
                          ),
                          subtitle: Text(
                            author,
                          ),
                          leading: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder:
                                    (
                                      BuildContext context,
                                    ) {
                                      return DetailsDialog(
                                        bookId: book.id,
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
                            icon: Icon(
                              Icons.info,
                            ),
                          ),
                        ),
                      );
                    },
              );
            },
      ),
    );
  }
}
