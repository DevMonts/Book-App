import 'dart:ui';
import 'package:book_app/common/constants/app_button.dart';
import 'package:book_app/common/constants/app_card.dart';
import 'package:book_app/common/constants/app_text_form_field.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/book/logic/providers/register_book_provider.dart';
import 'package:book_app/features/book/presentation/widget/select_color_dialog.dart';
import 'package:book_app/features/book/presentation/widget/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class RegisterBookPage extends StatefulWidget {
  const RegisterBookPage({super.key});
  @override
  State<RegisterBookPage> createState() => _RegisterBookPageState();
}

class _RegisterBookPageState extends State<RegisterBookPage> {
  TextEditingController titleController = TextEditingController();
  int? numberOfStars = 3;
  Color? selectedColor;
  bool isPaused = false;
  bool isRereading = false;
  bool isEbook = false;
  bool isInWishlist = false;
  String? selectedIcon;
  TextEditingController currentPageController = TextEditingController(
    text: '1',
  );
  TextEditingController pagesController = TextEditingController(
    text: '1',
  );
  TextEditingController authorController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController colorController = TextEditingController(
    text: AppStrings.color,
  );

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
    //TODO: componentize register page

    final List<Map<String, dynamic>> iconsList = [
      {'string': 'ac_unit', 'icon': Icons.ac_unit},
      {
        'string': 'anchor',
        'icon': Icons.anchor,
      },
      {
        'string': 'brightness_3',
        'icon': Icons.brightness_3,
      },
      {
        'string': 'church',
        'icon': Icons.church,
      },
      {
        'string': 'cloud',
        'icon': Icons.cloud,
      },
      {
        'string': 'cottage',
        'icon': Icons.cottage,
      },
      {
        'string': 'deck',
        'icon': Icons.deck,
      },
      {
        'string': 'delete',
        'icon': Icons.delete,
      },
      {
        'string': 'electric_bolt',
        'icon': Icons.electric_bolt,
      },
      {
        'string': 'explore',
        'icon': Icons.explore,
      },
      {
        'string': 'favorite',
        'icon': Icons.favorite,
      },
      {
        'string': 'heart_broken',
        'icon': Icons.heart_broken,
      },
      {
        'string': 'local_fire_department',
        'icon': Icons.local_fire_department,
      },
      {
        'string': 'local_florist',
        'icon': Icons.local_florist,
      },
      {
        'string': 'local_pizza',
        'icon': Icons.local_pizza,
      },
      {
        'string': 'sunny',
        'icon': Icons.sunny,
      },
    ];

    final remainPages =
        int.parse(
          pagesController.text,
        ) -
        int.parse(
          currentPageController.text,
        );

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: titleController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: AppStrings.title,
            border: InputBorder.none,
          ),
        ),

        actions: [
          SizedBox(
            width: 50,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              AppCard(
                child: Column(
                  children: [
                    SwitchWidget(
                      text1: 'LENDO',
                      text2: 'PAUSADO',
                      icon1: Icons.play_arrow,
                      icon2: Icons.pause,
                      value: isPaused,
                      onChanged:
                          (
                            value,
                          ) {
                            setState(
                              () {
                                isPaused = value;
                              },
                            );
                          },
                    ),
                    SwitchWidget(
                      text1: 'LEITURA',
                      text2: 'RELEITURA',
                      icon1: Icons.auto_stories,
                      icon2: Icons.replay,
                      value: isRereading,
                      onChanged:
                          (
                            value,
                          ) {
                            setState(
                              () {
                                isRereading = value;
                              },
                            );
                          },
                    ),
                    SwitchWidget(
                      text1: 'LIVRO',
                      text2: 'EBOOK',
                      icon1: Icons.book,
                      icon2: Icons.tablet_android,
                      value: isEbook,
                      onChanged:
                          (
                            value,
                          ) {
                            setState(
                              () {
                                isEbook = value;
                              },
                            );
                          },
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 67,
                      child: AppCard(
                        child: Center(
                          child: RatingBar.builder(
                            itemSize: 24,
                            updateOnDrag: true,
                            initialRating: 3,
                            minRating: 1,
                            itemCount: 5,
                            itemBuilder:
                                (
                                  context,
                                  _,
                                ) => Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                            onRatingUpdate:
                                (
                                  rating,
                                ) {
                                  setState(
                                    () {
                                      numberOfStars = rating.toInt();
                                    },
                                  );
                                },
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 24,
                  ),

                  AppCard(
                    child: Row(
                      children: [
                        Checkbox(
                          value: isInWishlist,
                          onChanged:
                              (
                                value,
                              ) {
                                setState(
                                  () {
                                    isInWishlist = value!;
                                  },
                                );
                              },
                        ),
                        Text(
                          'Wishlist',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 24,
                  ),

                  AppButton(
                    onPressed: () async {
                      final pickedColor = await showDialog<Color>(
                        context: context,
                        builder:
                            (
                              context,
                            ) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5,
                                  sigmaY: 5,
                                ),
                                child: SelectColorDialog(),
                              );
                            },
                      );
                      if (pickedColor != null) {
                        setState(
                          () {
                            selectedColor = pickedColor;
                            colorController.text =
                                '#${pickedColor.value.toRadixString(
                                  16,
                                ).padLeft(
                                  8,
                                  '0',
                                ).toUpperCase()}';
                          },
                        );
                      }
                    },
                    icon: Icon(
                      Icons.palette,
                      color: selectedColor,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 25,
              ),

              AppCard(
                child: SizedBox(
                  height: 100,
                  child: GridView.builder(
                    itemCount: iconsList.length,
                    itemBuilder:
                        (
                          context,
                          index,
                        ) {
                          return GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  if (selectedIcon ==
                                      iconsList[index]['string']) {
                                    selectedIcon = null;
                                  } else {
                                    selectedIcon = iconsList[index]['string'];
                                  }
                                },
                              );
                            },
                            child: Icon(
                              iconsList[index]['icon'],
                              color: selectedIcon == iconsList[index]['string']
                                  ? [
                                      Colors.cyanAccent,
                                      Colors.grey,
                                      Colors.yellow,
                                      Colors.white,
                                      Colors.white,
                                      Colors.orange,
                                      Colors.brown,
                                      Colors.grey,
                                      Colors.yellow,
                                      Colors.grey,
                                      Colors.red,
                                      Colors.red,
                                      Colors.orange,
                                      Colors.pink,
                                      Colors.yellow,
                                      Colors.yellow,
                                    ][index]
                                  : Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                            ),
                          );
                        },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),

              AppCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 50,
                          child: CupertinoPicker(
                            itemExtent: 30,
                            onSelectedItemChanged: (index) {
                              final currentPage = (index + 1).toString();
                              setState(() {
                                currentPageController.text = currentPage;
                              });
                            },
                            children: List<Widget>.generate(
                              2000,
                              (index) => Center(
                                child: Text(
                                  '${index + 1}',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '/',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 50,
                          child: CupertinoPicker(
                            itemExtent: 30,
                            onSelectedItemChanged: (index) {
                              final pages = (index + 1).toString();
                              setState(() {
                                pagesController.text = pages;
                              });
                            },
                            children: List<Widget>.generate(
                              2000,
                              (index) => Center(
                                child: Text(
                                  '${index + 1}',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${currentPageController.text} página(s) lida(s) de ${pagesController.text} página(s) no total.',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Restam $remainPages página(s) para terminar o livro.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: AppTextFormField(
                      hintText: AppStrings.author,
                      controller: authorController,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Flexible(
                    flex: 2,
                    child: AppTextFormField(
                      hintText: AppStrings.gender,
                      controller: genderController,
                    ),
                  ),
                ],
              ),

              AppTextFormField(
                controller: reviewController,
                hintText: AppStrings.review,
                maxLines: 10,
                height: 300,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () async {
            if (titleController.text.isEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                SnackBar(
                  content: Text(
                    AppStrings.requiredTitle,
                  ),
                ),
              );
            } else {
              final registerBookProvider = Provider.of<RegisterBookProvider>(
                context,
                listen: false,
              );
              await registerBookProvider.sendBookToFirestore(
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
              Navigator.of(
                context,
              ).pop();
            }
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
