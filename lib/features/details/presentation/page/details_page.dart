import 'package:book_app/features/details/presentation/page/review_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/details/logic/provider/delete_book_provider.dart';

class DetailsPage extends StatelessWidget {
  final String bookId;
  final String title;
  final String author;
  final String pages;
  final String currentPage;
  //final String publicationDate;
  final String gender;
  final String format;
  //final String synopsis;
  final String review;
  //TODO: book size
  //TODO: book icon
  final Color bookColor;
  const DetailsPage({
    super.key,
    required this.bookId,
    required this.title,
    required this.author,
    required this.pages,
    required this.currentPage,
    //required this.publicationDate,
    required this.gender,
    required this.format,
    //required this.synopsis,
    required this.review,
    //TODO: book size
    //TODO: book icon
    required this.bookColor,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<DeleteBookProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bookColor,
        actions: [
          ElevatedButton(
            onPressed: () async {
              await Provider.of<DeleteBookProvider>(
                context,
                listen: false,
              ).deleteBookFromFirestore(
                context: context,
                bookId: bookId,
                bookColor: bookColor,
              );
              // if (!Provider.of<DeleteBookProvider>(
              //   context,
              //   listen: false,
              // ).isDeleteConfirmed) {
              Navigator.of(
                context,
              ).pop();
            },
            child: Text(
              AppStrings.delete,
              style: TextStyle(
                color: AppColors.red,
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder:
          //             (
          //               context,
          //             ) => SynopsisPage(
          //               synopsis: synopsis,
          //             ),
          //       ),
          //     );
          //   },
          //   child: Text(
          //     AppStrings.synopsis,
          //   ),
          // ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (
                        context,
                      ) => ReviewPage(
                        review: review,
                      ),
                ),
              );
            },
            child: Text(
              AppStrings.review,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.transparent,
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
                          // margin: const EdgeInsets.all(
                          //   10,
                          // ),
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
                                        '${title.isEmpty ? '' : '$title '}${author.isEmpty ? '' : 'de $author, '}${gender.isEmpty ? '' : 'é do gênero $gender, '}',
                                        style: TextStyle(
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: AppColors.brown04,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${pages.isEmpty ? ' ' : 'Contem $pages páginas '}${currentPage.isEmpty ? '' : 'e foi lido até a página $currentPage '}${format.isEmpty ? '' : 'no formato $format'}.',
                                        style: TextStyle(
                                          color: AppColors.black,
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
      // bottomNavigationBar: Consumer<DeleteBookProvider>(
      //   builder:
      //       (
      //         context,
      //         deleteBookProvider,
      //         child,
      //       ) {
      //         return BottomNavigationBar(
      //           showUnselectedLabels: true,
      //           selectedItemColor: AppColors.pink,
      //           unselectedItemColor: AppColors.pink,
      //           backgroundColor: bookColor,
      //           items: [
      //             BottomNavigationBarItem(
      //               icon: IconButton(
      //                 icon: Icon(
      //                   Icons.west,
      //                 ),
      //                 color: AppColors.pink,
      //                 onPressed: () {
      //                   Navigator.of(
      //                     context,
      //                   ).pop();
      //                 },
      //               ),
      //               label: AppStrings.back,
      //             ),
      //             BottomNavigationBarItem(
      //               icon: IconButton(
      //                 icon: Icon(
      //                   Icons.delete,
      //                 ),
      //                 color: AppColors.red,
      //                 // TextButton(
      //                 onPressed: () async {
      //                   await deleteBookProvider.deleteBookFromFirestore(
      //                     context: context,
      //                     bookId: bookId,
      //                   );
      //                   if (!deleteBookProvider.isDeleteConfirmed) {
      //                     Navigator.of(
      //                       context,
      //                     ).pop();
      //                   }
      //                 },
      //               ),
      //               label: AppStrings.delete,
      //             ),
      //             BottomNavigationBarItem(
      //               icon: IconButton(
      //                 icon: Icon(
      //                   Icons.edit_note,
      //                 ),
      //                 color: AppColors.brown02,
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder:
      //                           (
      //                             context,
      //                           ) => SynopsisPage(
      //                             synopsis: synopsis,
      //                           ),
      //                     ),
      //                   );
      //                 },
      //               ),
      //               label: AppStrings.synopsis,
      //             ),
      //             BottomNavigationBarItem(
      //               icon: IconButton(
      //                 icon: Icon(
      //                   Icons.edit_note,
      //                 ),
      //                 color: AppColors.brown02,
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder:
      //                           (
      //                             context,
      //                           ) => ReviewPage(
      //                             review: review,
      //                           ),
      //                     ),
      //                   );
      //                 },
      //               ),
      //               label: AppStrings.review,
      //             ),
      //           ],
      //         );
      //       },
      // ),
    );
  }
}
