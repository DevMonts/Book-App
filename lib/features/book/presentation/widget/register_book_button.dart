import 'package:book_app/features/book/repository/register_book_repository.dart';
import 'package:flutter/material.dart';

class RegisterBookButton extends StatelessWidget {
  //TODO: model

  //7- Receipt to manipulate
  final TextEditingController titleController;
  final bool isPaused;
  final bool isRereading;
  final bool isEbook;
  final int numberOfStars;
  final bool isInWishlist;
  final Color selectedColor;
  final String? selectedIcon;
  final int currentPage;
  final int pages;
  final TextEditingController authorController;
  final TextEditingController genderController;
  final TextEditingController reviewController;

  final RegisterBookRepository registerBookRepository;
  final PageController pageController;
  final bool isLoading;
  final VoidCallback onPressed;
  final VoidCallback startLoading;
  final VoidCallback stopLoading;
  const RegisterBookButton({
    super.key,

    //6- Requires receipt
    required this.titleController,
    required this.isPaused,
    required this.isRereading,
    required this.isEbook,
    required this.numberOfStars,
    required this.isInWishlist,
    required this.selectedColor,
    required this.selectedIcon,
    required this.currentPage,
    required this.pages,
    required this.authorController,
    required this.genderController,
    required this.reviewController,

    required this.registerBookRepository,
    required this.pageController,
    required this.isLoading,
    required this.onPressed,
    required this.startLoading,
    required this.stopLoading,
  });

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
          await registerBookRepository.sendBookToFirestore(
            //8- Passed as a parameter
            title: titleController.text,
            isPaused: isPaused,
            isRereading: isRereading,
            isEbook: isEbook,
            numberOfStars: numberOfStars,
            isInWishlist: isInWishlist,
            color: selectedColor,
            icon: (selectedIcon != null) ? selectedIcon : '',
            currentPage: currentPage,
            pages: pages,
            author: authorController.text,
            gender: genderController.text,
            review: reviewController.text,
            //TODO: Use use books registered by other users
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
