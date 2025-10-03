import 'package:book_app/common/constants/app_color_button.dart';
import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_image_widget.dart';
import 'package:book_app/common/constants/app_text_form_field.dart';
import 'package:book_app/common/constants/app_stars_widget.dart';
import 'package:book_app/features/book/logic/providers/catch_book_color_provider.dart';
import 'package:book_app/features/book/logic/providers/color_animation_provider.dart';
import 'package:book_app/features/book/logic/providers/page_number_provider.dart';
import 'package:book_app/features/book/presentation/widget/categories_widget.dart';
import 'package:book_app/features/book/presentation/widget/format_book_widget.dart';
import 'package:book_app/features/book/presentation/widget/icons_widget.dart';
import 'package:book_app/features/book/presentation/widget/pages_number_widget.dart';
import 'package:book_app/features/book/presentation/widget/register_book_button.dart';
import 'package:book_app/features/book/repositories/register_book_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:provider/provider.dart';

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
  //1- Declaration
  TextEditingController titleController = TextEditingController();

  String category = 'Lido';

  int numberOfStars = 3;
  Color selectedColor = AppColors.brown08;
  TextEditingController colorController = TextEditingController();

  TextEditingController authorController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool isEbook = false;

  XFile? bookCover;

  String? selectedIcon;
  TextEditingController reviewController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final animatedColor = context.watch<ColorAnimationProvider>().animatedColor;
    final pageNumberProvider = context.watch<PageNumberProvider>();

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('ADICIONAR LIVRO'),
          actions: [
            IconButton(
              onPressed: () {
                FocusScope.of(
                  context,
                ).unfocus();
                widget.pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
              icon: Row(
                children: [
                  Icon(Icons.shelves),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                AppTextFormField(
                  hintText: 'Título',
                  controller: titleController, //2- Passed as a parameter
                ),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 2 / 3,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CategoriesWidget(
                      selectedCategory: category, //2- Passed as a parameter
                      setState: (value) {
                        setState(() => category = value!);
                      },
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PagesNumberWidget(
                          //2- Passed as a parameter
                          thousands: pageNumberProvider.thousands,
                          hundred: pageNumberProvider.hundred,
                          ten: pageNumberProvider.ten,
                          unit: pageNumberProvider.unit,

                          onFirstNumberSelected: (value) =>
                              pageNumberProvider.setThousands(value.toString()),
                          onSecondNumberSelected: (value) =>
                              pageNumberProvider.setHundred(value.toString()),
                          onThirdNumberSelected: (value) =>
                              pageNumberProvider.setTen(value.toString()),
                          onFourthNumberSelected: (value) =>
                              pageNumberProvider.setUnit(value.toString()),
                        ),

                        AppStarsWidget(
                          numberOfStars:
                              numberOfStars, //2- Passed as a parameter
                          onRatingUpdate: (value) {
                            setState(() {
                              numberOfStars = value;
                            });
                          },
                        ),

                        AppColorButton(
                          selectedColor:
                              selectedColor, //2- Passed as a parameter
                          colorController: colorController,
                          onColorChanged: (value) {
                            setState(() {
                              selectedColor = value;
                            });
                          },
                          icon: selectedColor == AppColors.brown08
                              ? AnimatedSwitcher(
                                  duration: Duration(
                                    seconds: 1,
                                  ),
                                  child: Icon(
                                    Icons.palette,
                                    key: ValueKey(
                                      animatedColor,
                                    ),
                                    color: animatedColor,
                                  ),
                                )
                              : Icon(
                                  Icons.palette,
                                  color: selectedColor,
                                ),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            AppTextFormField(
                              hintText: 'Autor',
                              controller:
                                  authorController, //2- Passed as a parameter
                            ),

                            AppTextFormField(
                              hintText: 'Gênero',
                              controller:
                                  genderController, //2- Passed as a parameter
                            ),
                          ],
                        ),

                        FormatBookWidget(
                          isEbook: isEbook,
                          onChanged: (value) => setState(() => isEbook = value),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            'Capa do Livro',
                          ),
                          Expanded(
                            child: AppImageWidget(
                              img: bookCover, //2- Passed as a parameter
                              onImageSelected: () async {
                                ImagePicker imagePicker = ImagePicker();
                                XFile? image = await imagePicker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (image != null) {
                                  final imageBytes = await image.readAsBytes();
                                  final decodeImage = img.decodeImage(
                                    imageBytes,
                                  );
                                  if (decodeImage != null) {
                                    final bookPixelColor = decodeImage.getPixel(
                                      0,
                                      decodeImage.height - 1,
                                    );
                                    final r = bookPixelColor.r;
                                    final g = bookPixelColor.g;
                                    final b = bookPixelColor.b;

                                    final bookColor = Color.fromRGBO(
                                      r.toInt(),
                                      g.toInt(),
                                      b.toInt(),
                                      1,
                                    );
                                    Provider.of<CatchBookColorProvider>(
                                      context,
                                      listen: false,
                                    ).catchColor(
                                      bookColor,
                                    );
                                    setState(
                                      () {
                                        bookCover = image;
                                        selectedColor = bookColor;
                                      },
                                    );
                                  }
                                }
                              },
                              onImageDeleted: () {
                                setState(() {
                                  bookCover = null;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                IconsWidget(
                  selectedIcon: selectedIcon, //2- Passed as a parameter
                  onIconSelected: (value) {
                    setState(() {
                      selectedIcon = value;
                    });
                  },
                ),

                AppTextFormField(
                  controller: reviewController, //2- Passed as a parameter
                  hintText: 'Resenha',
                  maxLines: 10,
                  height: 300,
                ),

                //TODO: DETAILED REGISTER:
                // synopsis...
              ],
            ),
          ),
        ),

        floatingActionButton: RegisterBookButton(
          //3- Receipt updated parameter
          titleController: titleController,
          category: category,
          pages: context.read<PageNumberProvider>().pages,
          numberOfStars: numberOfStars,
          selectedColor: selectedColor,
          authorController: authorController,
          genderController: genderController,
          isEbook: isEbook,
          bookCover: bookCover,
          selectedIcon: selectedIcon,
          reviewController: reviewController,

          registerBookRepository: widget.registerBookRepository,
          pageController: widget.pageController,
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
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    genderController.dispose();
    colorController.dispose();
    reviewController.dispose();
    super.dispose();
  }
}
