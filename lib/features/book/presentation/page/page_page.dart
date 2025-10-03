import 'package:book_app/common/constants/app_text_style.dart';
import 'package:book_app/features/book/logic/providers/delete_book_provider.dart';
import 'package:book_app/common/utils/icons_converter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagePage extends StatefulWidget {
  final String bookId;
  final String title;
  final String category;
  final Color bookColor;
  final String author;
  final int pages;
  final int numberOfStars;
  final String gender;
  final bool isEbook;
  final String? bookCoverUrl;
  final String icon;
  final String review;
  const PagePage({
    super.key,
    required this.bookId,
    required this.title,
    required this.category,
    required this.bookColor,
    required this.author,
    required this.pages,
    required this.numberOfStars,
    required this.gender,
    required this.isEbook,
    this.bookCoverUrl,
    required this.icon,
    required this.review,
  });

  @override
  State<PagePage> createState() => _PagePageState();
}

class _PagePageState extends State<PagePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(
          context,
        ).pop();
        Navigator.of(
          context,
        ).pop();
        return Future.value(
          false,
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: AppTextStyle.textStyle,
          title: Row(
            children: [
              Icon(
                IconsConverter.getIconFromString(
                  widget.icon,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.isEbook == true
                    ? 'Ebook: ${widget.title}'
                    : widget.title,
              ),
            ],
          ),
          actions: [
            ...List.generate(
              widget.numberOfStars,
              (
                index,
              ) => const Icon(
                Icons.star,
              ),
            ),
            IconButton(
              onPressed: () async {
                await Provider.of<DeleteBookProvider>(
                  context,
                  listen: false,
                ).deleteBookFromFirestore(
                  context: context,
                  bookId: widget.bookId,
                );
                Navigator.of(
                  context,
                ).pop();
              },
              icon: Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Categoria: ${widget.category}\n\nPáginas: ${widget.pages == 0 ? '-' : widget.pages}\n\nGênero: ${widget.gender == '' ? '-' : widget.gender}\n\nAutor: ${widget.author == '' ? '-' : widget.author}\n\nResenha:\n\n${widget.review == '' ? '-' : widget.review}',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
