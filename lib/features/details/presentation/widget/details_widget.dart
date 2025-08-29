import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_input_decoration.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/details/logic/provider/delete_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsWidget extends StatefulWidget {
  final String bookId;
  final String title;
  final String author;
  final String pages;
  final String currentPage;
  //final String publicationDate;
  final String gender;
  final String format;
  final String color;
  final String synopsis;
  //TODO: book size
  //TODO: book icon
  final Color bookColor;
  const DetailsWidget({
    super.key,
    required this.bookId,
    required this.title,
    required this.author,
    required this.pages,
    required this.currentPage,
    //required this.publicationDate,
    required this.gender,
    required this.format,
    required this.color,
    required this.synopsis,
    //TODO: book size
    //TODO: book icon
    required this.bookColor,
  });

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DeleteBookProvider>(
      context,
      listen: false,
    );
    return Consumer<DeleteBookProvider>(
      builder:
          (
            context,
            deleteBookProvider,
            child,
          ) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(
                  context,
                ).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      initialValue: widget.title,
                      decoration: AppInputDecoration.inputDecoration.copyWith(
                        fillColor: widget.bookColor,
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: AppColors.paper,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      initialValue: widget.author,
                      decoration: AppInputDecoration.inputDecoration.copyWith(
                        fillColor: widget.bookColor,
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: AppColors.paper,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      initialValue: '${widget.pages} páginas',
                      decoration: AppInputDecoration.inputDecoration.copyWith(
                        fillColor: widget.bookColor,
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: AppColors.paper,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      initialValue: '${widget.currentPage} páginas lidas',
                      decoration: AppInputDecoration.inputDecoration.copyWith(
                        fillColor: widget.bookColor,
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: AppColors.paper,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      initialValue: widget.gender,
                      decoration: AppInputDecoration.inputDecoration.copyWith(
                        fillColor: widget.bookColor,
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: AppColors.paper,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      initialValue: widget.format,
                      decoration: AppInputDecoration.inputDecoration.copyWith(
                        fillColor: widget.bookColor,
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: AppColors.paper,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      initialValue: widget.color,
                      decoration: AppInputDecoration.inputDecoration.copyWith(
                        fillColor: widget.bookColor,
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: AppColors.paper,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    SingleChildScrollView(
                      child: TextFormField(
                        initialValue: widget.synopsis,
                        decoration: AppInputDecoration.inputDecoration.copyWith(
                          fillColor: widget.bookColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        readOnly: true,
                        maxLines: 10,
                        style: TextStyle(
                          color: AppColors.paper,
                        ),
                      ),
                    ),

                    // SizedBox(
                    //   height: //20
                    //       10,
                    // ),
                    //TODO: edit button
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.red,
                        minimumSize: const Size(
                          double.infinity,
                          50,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () async {
                        // final
                        await deleteBookProvider
                            .deleteBookFromFirestore //= Provider.of<DeleteBookProvider>
                            (
                              context: context,
                              //   listen: false,
                              // );
                              // deleteBookProvider.deleteBookFromFirestore(
                              bookId: widget.bookId,
                            );
                        if (!deleteBookProvider.isDeleteConfirmed) {
                          Navigator.of(
                            context,
                          ).pop();
                        }
                      },
                      child:
                          // Icon(
                          //   Icons.delete,
                          //   color: AppColors.paper,
                          // ),
                          Text(
                            deleteBookProvider.isDeleteConfirmed
                                ? AppStrings.delete
                                : AppStrings.doubleClickToDelete,
                            style: TextStyle(
                              color: AppColors.paper,
                            ),
                          ),
                    ),

                    // IconButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   icon: Icon(
                    //     Icons.sensor_door,
                    //     color: AppColors.middleWood,
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
    );
  }
}
