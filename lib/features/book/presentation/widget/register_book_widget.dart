import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_input_decoration.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/book/logic/provider/register_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterBookWidget extends StatelessWidget {
  const RegisterBookWidget({super.key});
  @override
  Widget build(BuildContext context) {
    //TODO: book color
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
    return //AlertDialog(
    // titlePadding: EdgeInsets.all(
    //   40,
    // ),
    // title: Row(
    //   children: [
    //TODO: Floating Book Cover
    // Expanded(
    //   child: TextField(
    //     decoration: AppInputDecoration.inputDecoration.copyWith(
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
    //     decoration: AppInputDecoration.inputDecoration.copyWith(
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
                    labelText: AppStrings.title,
                  ),
                  controller: titleController,
                ),
                SizedBox(
                  height: //40
                      10,
                ),
                TextFormField(
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    labelText: AppStrings.pages,
                  ),
                  keyboardType: TextInputType.number,
                  controller: pagesController,
                ),
                SizedBox(
                  height: //40
                      10,
                ),
                TextFormField(
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    labelText: AppStrings.currentPage,
                  ),
                  keyboardType: TextInputType.number,
                  controller: currentPageController,
                ),
                SizedBox(
                  height: //40
                      10,
                ),
                TextFormField(
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    labelText: AppStrings.author,
                  ),
                  controller: authorController,
                ),
                SizedBox(
                  height: //40
                      10,
                ),
                TextFormField(
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    labelText: AppStrings.gender,
                  ),
                  controller: genderController,
                ),
                SizedBox(
                  height: //40
                      10,
                ),
                TextFormField(
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    labelText: AppStrings.format,
                  ),
                  controller: formatController,
                ),
                SizedBox(
                  height: //60
                      10,
                ),
                SizedBox(
                  width: 500,
                  child: TextFormField(
                    decoration: AppInputDecoration.inputDecoration.copyWith(
                      labelText: AppStrings.synopsis,
                    ),
                    maxLines: 3,
                    controller: synopsisController,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //TODO: Use use books registered by other users
                //TODO: change to avaliation with stars
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkWood,
                    minimumSize: const Size(
                      double.infinity,
                      100,
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
                    );
                    Navigator.of(
                      context,
                    ).pop();
                  },
                  child: Icon(
                    Icons.add,
                    color: AppColors.paper,
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
