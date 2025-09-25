import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BookOpenWidget extends StatelessWidget {
  const BookOpenWidget({
    super.key,
    required this.bookColor,
    required this.title,
    required this.author,
    required this.pages,
    required this.currentPage,
    required this.gender,
    required this.isEbook,
    required this.review,
    this.bookCoverUrl,
  });
  final Color bookColor;
  final String title;
  final String author;
  final int pages;
  final int currentPage;
  final String gender;
  final bool isEbook;
  final String review;
  final String? bookCoverUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: bookColor,
          width: 7,
        ),
        color: Colors.white,
      ),
      width: 300,
      height: 200,
      child: Row(
        children: [
          Container(
            color: Colors.grey.shade100,
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                10,
              ),
              child: Text(
                //O livro/ebook tal, de Fulano é do gênero tal. Contêm x páginas e dessas, você leu y.
                'O ${isEbook ? 'ebook' : 'livro'} $title, ${author.isEmpty ? '' : 'de $author, '}${gender.isEmpty ? '' : 'é do gênero $gender'}. Contêm ${pages.toString()} páginas e dessas, você leu ${currentPage.toString()} Faltam ${(pages - currentPage).toString()} páginas para terminar',
                style: TextStyle(
                  color: AppColors.brown14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          VerticalDivider(
            color: Colors.grey.shade100,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                review,
                style: TextStyle(
                  color: AppColors.brown14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade100,
            width: 20,
          ),
        ],
      ),
    );
  }
}
