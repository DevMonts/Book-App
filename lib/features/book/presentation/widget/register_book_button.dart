import 'dart:io';

import 'package:book_app/features/book/data/model/book_model.dart';
import 'package:book_app/features/book/logic/providers/upload_image_provider.dart';
import 'package:book_app/features/book/repositories/register_book_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterBookButton extends StatelessWidget {
  const RegisterBookButton({
    super.key,

    //4- Requires receipt
    required this.titleController,
    required this.category,
    required this.pages,
    required this.numberOfStars,
    required this.selectedColor,
    required this.authorController,
    required this.genderController,
    required this.isEbook,
    required this.bookCover,
    required this.selectedIcon,
    required this.reviewController,

    required this.registerBookRepository,
    required this.pageController,
    required this.isLoading,
    required this.onPressed,
    required this.startLoading,
    required this.stopLoading,
  });

  //5- Receipt to manipulate
  final TextEditingController titleController;
  final String category;
  final int pages;
  final int numberOfStars;
  final Color selectedColor;
  final TextEditingController authorController;
  final TextEditingController genderController;
  final bool isEbook;
  final XFile? bookCover;
  final String? selectedIcon;
  final TextEditingController reviewController;

  final RegisterBookRepository registerBookRepository;
  final PageController pageController;
  final bool isLoading;
  final VoidCallback onPressed;
  final VoidCallback startLoading;
  final VoidCallback stopLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        onPressed: () async {
          if (titleController.text.isEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              const SnackBar(
                content: Text(
                  'Preencha o título',
                ),
              ),
            );
            return;
          }
          startLoading();
          String? imageUrl;
          if (bookCover != null) {
            final uploadImageProvider = UploadImageProvider();
            imageUrl = await uploadImageProvider.uploadImage(
              File(
                bookCover!.path,
              ),
            );
          }
          final bookModel = BookModel(
            //6- Passed as a parameter
            title: titleController.text,
            category: category,
            pages: pages,
            numberOfStars: numberOfStars,
            color: selectedColor,
            author: authorController.text,
            gender: genderController.text,
            isEbook: isEbook,
            bookCoverUrl: imageUrl,
            icon: selectedIcon,
            review: reviewController.text,
            createdAt: DateTime.now(),
          );
          await registerBookRepository.sendBookToFirestore(
            bookModel,
          );
          stopLoading();
          pageController.animateToPage(
            1,
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.linear,
          );
          FocusScope.of(
            context,
          ).unfocus();
        },
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Theme.of(
                    context,
                  ).colorScheme.surface,
                ),
              )
            : const Icon(
                Icons.add,
              ),
      ),
    );
  }
}
