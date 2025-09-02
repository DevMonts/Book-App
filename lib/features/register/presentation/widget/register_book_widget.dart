import 'dart:ui';
import 'package:book_app/common/constants/app_input_decoration.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/register/logic/providers/register_book_provider.dart';
import 'package:book_app/features/details/presentation/widget/select_color_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterBookWidget extends StatefulWidget {
  const RegisterBookWidget({super.key});
  @override
  State<RegisterBookWidget> createState() => _RegisterBookWidgetState();
}

class _RegisterBookWidgetState extends State<RegisterBookWidget> {
  Color? selectedColor;
  late TextEditingController colorController;

  @override
  void initState() {
    super.initState();
    colorController = TextEditingController(
      text: AppStrings.color,
    );
  }

  @override
  void dispose() {
    colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: book size
    //TODO: book icon
    final currentPageController = TextEditingController();
    final pagesController = TextEditingController();
    //final publicationDateController = TextEditingController();
    final titleController = TextEditingController();
    final authorController = TextEditingController();
    final genderController = TextEditingController();
    final formatController = TextEditingController();
    final synopsisController = TextEditingController();
    final reviewController = TextEditingController();

    return //AlertDialog(
    // titlePadding: EdgeInsets.all(
    //   40,
    // ),
    // title: Row(
    //   children: [
    //TODO: Floating Book Cover
    // Expanded(
    //   child: TextField(
    //     decoration: AppInputDecoration.inputDecoration(context,).copyWith(
    //       labelText: AppStrings.pages,
    //     ),
    //     keyboardType: TextInputType.number,
    //     controller: pagesController,
    //   ),
    // ),
    // const SizedBox(
    //   width: 30,
    // ),
    // Expanded(
    //   child: TextField(
    //     decoration: AppInputDecoration.inputDecoration(context,).copyWith(
    //       labelText: AppStrings.publicationDate,
    //     ),
    //     keyboardType: TextInputType.datetime,
    //     controller: publicationDateController,
    //   ),
    // ),
    //   ],
    // ),
    // contentPadding: EdgeInsets.all(
    //   40,
    // ),
    //content:
    Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(
          context,
        ).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child:
            //Wrap(
            //children: [
            Column(
              //mainAxisSize: MainAxisSize.min,
              //backgroundColor: AppColors.paper,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadiusGeometry.circular(
              //     50,
              //   ), //.zero,
              //   //side: BorderSide(width: 6),
              // ),
              children: [
                TextFormField(
                  //TODO: required field
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    fillColor: selectedColor,
                    labelText: AppStrings.title,
                  ),
                  controller: titleController,
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

                TextFormField(
                  controller: colorController,
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    fillColor: selectedColor,
                  ),
                  readOnly: true,
                  onTap: () async {
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
                ),

                SizedBox(
                  height: 10,
                ),

                //TODO: Use use books registered by other users
                //TODO: change to avaliation with stars
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (selectedColor != null)
                        ? selectedColor
                        : Theme.of(
                            context,
                          ).scaffoldBackgroundColor,
                    minimumSize: const Size(
                      double.infinity,
                      //100
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () async {
                    final registerBookProvider =
                        Provider.of<RegisterBookProvider>(
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
                    );
                    Navigator.of(
                      context,
                    ).pop();
                  },
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
