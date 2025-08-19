import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/features/details/logic/provider/delete_book_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    return AlertDialog(
      title: Text(
        widget.title,
      ),
      content: Column(
        children: [
          Text(
            'Autor: ${widget.author}',
          ),
          Text(
            'Páginas: ${widget.pages}',
          ),
          // Text(
          //   'Data de Publicação: ${widget.publicationDate}',
          // ),
          Text(
            'Gênero: ${widget.gender}',
          ),
          Text(
            'Formato: ${widget.format}',
          ),
          Text(
            'Sinopse: ${widget.synopsis}',
          ),
        ],
        mainAxisSize: MainAxisSize.min, //TODO: enlarge
      ),
      actions: [
        IconButton(
          onPressed: () {
            final deleteBookProvider = Provider.of<DeleteBookProvider>(
              context,
              listen: false,
            );
            deleteBookProvider.deleteBookFromFirestore(
              bookId: widget.bookId,
            );
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.delete,
            color: AppColors.wine,
          ),
        ),
        //TODO:
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
  }
}
