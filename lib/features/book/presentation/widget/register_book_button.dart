import 'package:book_app/features/book/repository/register_book_repository.dart';
import 'package:flutter/material.dart';

class RegisterBookButton extends StatelessWidget {
  //TODO: model
  final TextEditingController titleController;
  final TextEditingController currentPageController;
  final TextEditingController pagesController;
  final TextEditingController authorController;
  final TextEditingController genderController;
  final TextEditingController reviewController;
  final RegisterBookRepository registerBookRepository;
  final PageController pageController;
  final int numberOfStars;
  final Color selectedColor;
  final bool isPaused;
  final bool isRereading;
  final bool isEbook;
  final bool isInWishlist;
  final String? selectedIcon;
  final bool isLoading;
  final VoidCallback onPressed;
  final VoidCallback startLoading;
  final VoidCallback stopLoading;
  const RegisterBookButton({
    super.key,
    required this.titleController,
    required this.currentPageController,
    required this.pagesController,
    required this.authorController,
    required this.genderController,
    required this.reviewController,
    required this.registerBookRepository,
    required this.pageController,
    required this.numberOfStars,
    required this.selectedColor,
    required this.isPaused,
    required this.isRereading,
    required this.isEbook,
    required this.isInWishlist,
    required this.selectedIcon,
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
            title: titleController.text,
            numberOfStars: numberOfStars,
            color: selectedColor,
            format: isEbook ? 'ebook' : 'físico',
            isPaused: isPaused,
            isRereading: isRereading,
            isInWishlist: isInWishlist,
            icon: (selectedIcon != null) ? selectedIcon : '',
            currentPage: int.parse(
              currentPageController.text,
            ),
            pages: int.parse(
              pagesController.text,
            ),
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
          //TODO: close keyboard
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
