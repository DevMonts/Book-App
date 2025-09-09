import 'dart:ui';
import 'package:book_app/common/constants/app_button.dart';
import 'package:book_app/common/constants/app_input_decoration.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/register/logic/providers/register_book_provider.dart';
import 'package:book_app/features/details/presentation/widget/select_color_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterBookPage extends StatefulWidget {
  const RegisterBookPage({super.key});
  @override
  State<RegisterBookPage> createState() => _RegisterBookPageState();
}

class _RegisterBookPageState extends State<RegisterBookPage> {
  Color? selectedColor;
  String? selectedIcon;
  late TextEditingController colorController;
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    colorController = TextEditingController(
      text: AppStrings.color,
    );
    titleController = TextEditingController();
  }

  @override
  void dispose() {
    colorController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: book size
    final currentPageController = TextEditingController();
    final pagesController = TextEditingController();
    //final publicationDateController = TextEditingController();
    //final titleController = TextEditingController();
    final authorController = TextEditingController();
    final genderController = TextEditingController();
    final formatController = TextEditingController();
    final synopsisController = TextEditingController();
    final reviewController = TextEditingController();
    final List<Map<String, dynamic>> iconsList = [
      {
        'string': 'ac_unit',
        'icon': Icons.ac_unit,
      }, //cold
      {
        'string': 'anchor',
        'icon': Icons.anchor,
      }, //sea
      {
        'string': 'brightness_3',
        'icon': Icons.brightness_3,
      }, //night
      {
        'string': 'church',
        'icon': Icons.church,
      }, //church
      {
        'string': 'cloud',
        'icon': Icons.cloud,
      }, //cloud
      {
        'string': 'cottage',
        'icon': Icons.cottage,
      }, //house
      {
        'string': 'deck',
        'icon': Icons.deck,
      }, //table
      {
        'string': 'delete',
        'icon': Icons.delete,
      }, //trash
      {
        'string': 'electric_bolt',
        'icon': Icons.electric_bolt,
      }, //ray
      {
        'string': 'explore',
        'icon': Icons.explore,
      }, //compass
      {
        'string': 'favorite',
        'icon': Icons.favorite,
      }, //heart
      {
        'string': 'heart_broken',
        'icon': Icons.heart_broken,
      }, //heart broken
      {
        'string': 'local_fire_department',
        'icon': Icons.local_fire_department,
      }, //fire
      {
        'string': 'local_florist',
        'icon': Icons.local_florist,
      }, //flower
      {
        'string': 'local_pizza',
        'icon': Icons.local_pizza,
      }, //food
      {
        'string': 'sunny',
        'icon': Icons.sunny,
      }, //sun
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          kToolbarHeight + 10,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            AppBar(
              backgroundColor: Theme.of(
                context,
              ).scaffoldBackgroundColor,
              title: TextFormField(
                //TODO: required field
                decoration: AppInputDecoration.inputDecoration.copyWith(
                  labelText: AppStrings.title,
                ),
                controller: titleController,
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedColor,
                    minimumSize: Size(
                      0,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
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
                  child: Text(
                    AppStrings.color,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
                                selectedIcon = iconsList[index]['string'];
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(
                              10,
                            ),
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
                                      Colors.white,
                                      Colors.red,
                                      Colors.orange,
                                      Colors.pink,
                                      Colors.yellow,
                                      Colors.yellow,
                                    ][index]
                                  : Theme.of(
                                      context,
                                    ).primaryColor,
                            ),
                          ),
                        );
                      },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                decoration: AppInputDecoration.inputDecoration.copyWith(
                  fillColor: selectedColor,
                  labelText: AppStrings.pages,
                ),
                keyboardType: TextInputType.number,
                controller: pagesController,
              ),

              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: AppInputDecoration.inputDecoration.copyWith(
                  fillColor: selectedColor,
                  labelText: AppStrings.currentPage,
                ),
                keyboardType: TextInputType.number,
                controller: currentPageController,
              ),

              SizedBox(
                height: 10,
              ),

              TextFormField(
                decoration: AppInputDecoration.inputDecoration.copyWith(
                  fillColor: selectedColor,
                  labelText: AppStrings.author,
                ),
                controller: authorController,
              ),

              SizedBox(
                height: 10,
              ),

              TextFormField(
                decoration: AppInputDecoration.inputDecoration.copyWith(
                  fillColor: selectedColor,
                  labelText: AppStrings.gender,
                ),
                controller: genderController,
              ),

              SizedBox(
                height: 10,
              ),

              TextFormField(
                decoration: AppInputDecoration.inputDecoration.copyWith(
                  fillColor: selectedColor,
                  labelText: AppStrings.format,
                ),
                controller: formatController,
              ),

              SizedBox(
                height: 10,
              ),

              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    fillColor: selectedColor,
                    labelText: AppStrings.review,
                  ),
                  maxLines: 3,
                  controller: reviewController,
                ),
              ),

              SizedBox(
                height: 10,
              ),

              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    fillColor: selectedColor,
                    labelText: AppStrings.synopsis,
                  ),
                  maxLines: 3,
                  controller: synopsisController,
                ),
              ),

              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),

              //TODO: Use use books registered by other users
              //TODO: change to avaliation with stars
            ],
          ),
        ),
      ),
      floatingActionButton: AppButton(
        onPressed: () async {
          final registerBookProvider = Provider.of<RegisterBookProvider>(
            context,
            listen: false,
          );
          await registerBookProvider.sendBookToFirestore(
            currentPage: currentPageController.text,
            pages: pagesController.text,
            //publicationDate: publicationDateController.text,
            title: titleController.text,
            author: authorController.text,
            gender: genderController.text,
            format: formatController.text,
            synopsis: synopsisController.text,
            review: reviewController.text,
            color: selectedColor,
            icon: selectedIcon,
          );
          Navigator.of(
            context,
          ).pop();
        },
        icon: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
