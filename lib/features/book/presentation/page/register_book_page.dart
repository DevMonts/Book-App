import 'package:book_app/common/constants/app_color_button.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_text_form_field.dart';
import 'package:book_app/common/constants/app_checkbox.dart';
import 'package:book_app/common/constants/app_stars_widget.dart';
import 'package:book_app/features/book/presentation/widget/fields_widget.dart';
import 'package:book_app/features/book/presentation/widget/icons_widget.dart';
import 'package:book_app/features/book/presentation/widget/pages_number_widget.dart';
import 'package:book_app/features/book/presentation/widget/register_book_button.dart';
import 'package:book_app/features/book/presentation/widget/switches_widget.dart';
import 'package:book_app/features/book/repository/register_book_repository.dart';
import 'package:flutter/material.dart';

class RegisterBookPage extends StatefulWidget {
  final PageController pageController;
  final RegisterBookRepository registerBookRepository;
  const RegisterBookPage({
    super.key,
    required this.pageController,
    required this.registerBookRepository,
  });
  @override
  State<RegisterBookPage> createState() => _RegisterBookPageState();
}

class _RegisterBookPageState extends State<RegisterBookPage> {
  TextEditingController titleController = TextEditingController();
  int? numberOfStars = 3;
  Color? selectedColor = AppColors.brown08;
  bool isPaused = false;
  bool isRereading = false;
  bool isEbook = false;
  bool isInWishlist = false;
  bool isLoading = false;
  String? selectedIcon;
  TextEditingController currentPageController = TextEditingController(
    text: '1',
  );
  TextEditingController pagesController = TextEditingController(
    text: '1',
  );
  TextEditingController authorController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    genderController.dispose();
    currentPageController.dispose();
    pagesController.dispose();
    colorController.dispose();
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: IconButton(
            onPressed: () {
              widget.pageController.animateToPage(
                1,
                duration: Duration(
                  milliseconds: 300,
                ),
                curve: Curves.linear,
              );
            },
            icon: Icon(
              Icons.arrow_forward,
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(
        context,
      ).colorScheme.surface,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          child: Column(
            children: [
              AppTextFormField(
                hintText: 'Título',
                controller: titleController,
              ),

              SizedBox(height: 10),

              SwitchesWidget(
                isPaused: isPaused,
                isRereading: isRereading,
                isEbook: isEbook,
                onPausedChanged: (value) {
                  setState(() {
                    isPaused = value;
                  });
                },
                onRereadingChanged: (value) {
                  setState(() {
                    isRereading = value;
                  });
                },
                onEbookChanged: (value) {
                  setState(() {
                    isEbook = value;
                  });
                },
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  AppStarsWidget(
                    numberOfStars: numberOfStars!,
                    onRatingUpdate: (value) {
                      setState(() {
                        numberOfStars = value;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  AppCheckbox(
                    isInWishlist: isInWishlist,
                    onChanged: (value) {
                      setState(() {
                        isInWishlist = value;
                      });
                    },
                    text: 'WishList',
                  ),
                  SizedBox(width: 10),
                  AppColorButton(
                    selectedColor: (selectedColor != null)
                        ? selectedColor!
                        : AppColors.brown08,
                    colorController: colorController,
                    onColorChanged: (value) {
                      setState(() {
                        selectedColor = value;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 10),

              IconsWidget(
                selectedIcon: selectedIcon,
                onIconSelected: (value) {
                  setState(() {
                    selectedIcon = value;
                  });
                },
              ),

              SizedBox(height: 10),

              PagesNumberWidget(
                currentPageController: currentPageController,
                pagesController: pagesController,
              ),

              FieldsWidget(
                authorController: authorController,
                genderController: genderController,
                reviewController: reviewController,
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: RegisterBookButton(
        titleController: titleController,
        currentPageController: currentPageController,
        pagesController: pagesController,
        authorController: authorController,
        genderController: genderController,
        reviewController: reviewController,
        registerBookRepository: widget.registerBookRepository,
        pageController: widget.pageController,
        numberOfStars: 3,
        selectedColor: selectedColor!,
        isPaused: isPaused,
        isRereading: isRereading,
        isEbook: isEbook,
        isInWishlist: isInWishlist,
        selectedIcon: selectedIcon,
        isLoading: isLoading,
        onPressed: () {
          setState(() {
            isLoading = true;
          });
        },
        startLoading: () {
          setState(() {
            isLoading = true;
          });
        },
        stopLoading: () {
          setState(() {
            isLoading = false;
          });
        },
      ),
    );
  }
}
