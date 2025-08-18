import 'package:flutter/material.dart';

class DetailsDialog extends StatefulWidget {
  final String title;
  final String author;
  final String pages;
  final String publicationDate;
  final String gender;
  final String format;
  final String synopsis;
  const DetailsDialog({
    super.key,
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
          Text(
            'Data de Publicação: ${widget.publicationDate}',
          ),
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
        mainAxisSize: MainAxisSize.min,
      ),
      actions: [
        //TODO:
        //1- Delete
        //2- Edit
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.delete,
        //     color: AppColors.wine,
        //   ),
        // ),
        // IconButton(
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
          ),
        ),
      ],
    );
  }
}
