import 'package:book_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BookCloseWidget extends StatelessWidget {
  const BookCloseWidget({
    super.key,
    required this.bookColor,
    required this.title,
    this.bookCoverUrl,
  });
  final Color bookColor;
  final String title;
  final String? bookCoverUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      color: bookColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (bookCoverUrl == null)
            Padding(
              padding: const EdgeInsets.all(
                10,
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: (bookColor.computeLuminance() > .5)
                      ? AppColors.brown14
                      : AppColors.brown01,
                ),
              ),
            )
          else
            Image(
              image: NetworkImage(
                bookCoverUrl!,
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          Container(
            width: 40,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(
                top: BorderSide(
                  color: bookColor,
                  width: 7,
                ),
                right: BorderSide(
                  color: bookColor,
                  width: 7,
                ),
                bottom: BorderSide(
                  color: bookColor,
                  width: 7,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
