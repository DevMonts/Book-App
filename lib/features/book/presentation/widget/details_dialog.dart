import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/features/book/logic/provider/delete_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsDialog extends StatefulWidget {
  final String bookId;
  final String title;
  final String author;
  final String pages;
  final String publicationDate;
  final String gender;
  final String format;
  final String synopsis;
  const DetailsDialog({
    super.key,
    required this.bookId,
    required this.title,
    required this.author,
    required this.pages,
    required this.publicationDate,
    required this.gender,
    required this.format,
    required this.synopsis,
  });

  @override
  State<DetailsDialog> createState() => _DetailsDialogState();
}

class _DetailsDialogState extends State<DetailsDialog> {
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
            return //TODO: new theme
            AlertDialog(
              title: Text(
                widget.title,
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Autor: ${widget.author}',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Páginas: ${widget.pages}',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Gênero: ${widget.gender}',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Formato: ${widget.format}',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sinopse: ${widget.synopsis}',
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
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
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.wine,
                  ),
                ),
                //TODO: edit
                // IconButton
                //(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.edit,
                //   ),
                // ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.sensor_door,
                    color: AppColors.middleWood,
                  ),
                ),
              ],
            );
          },
    );
  }
}
