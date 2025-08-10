import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_input_decoration.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:book_app/features/register_book/logic/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterBookDialog extends StatelessWidget {
  const RegisterBookDialog({super.key});
  @override
  Widget build(BuildContext context) {
    final pagesController = TextEditingController();
    final publicationDateController = TextEditingController();
    final titleController = TextEditingController();
    final authorController = TextEditingController();
    final genderController = TextEditingController();
    final formatController = TextEditingController();
    final synopsisController = TextEditingController();
    return AlertDialog(
      titlePadding: EdgeInsets.all(40),
      title: Row(
        children: [
          //TODO: Use use books registered by other users
          //TODO: Floating Book Cover
          Expanded(
            child: TextField(
              decoration: AppInputDecoration.inputDecoration.copyWith(
                labelText: AppStrings.pages,
              ),
              keyboardType: TextInputType.number,
              controller: pagesController,
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: TextField(
              decoration: AppInputDecoration.inputDecoration.copyWith(
                labelText: AppStrings.publicationDate,
              ),
              keyboardType: TextInputType.datetime,
              controller: publicationDateController,
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.all(40),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: AppInputDecoration.inputDecoration.copyWith(
              labelText: AppStrings.title,
            ),
            controller: titleController,
          ),
          SizedBox(height: 40),
          TextFormField(
            decoration: AppInputDecoration.inputDecoration.copyWith(
              labelText: AppStrings.author,
            ),
            controller: authorController,
          ),
          SizedBox(height: 40),
          TextFormField(
            decoration: AppInputDecoration.inputDecoration.copyWith(
              labelText: AppStrings.gender,
            ),
            controller: genderController,
          ),
          SizedBox(height: 40),
          TextFormField(
            decoration: AppInputDecoration.inputDecoration.copyWith(
              labelText: AppStrings.format,
            ),
            controller: formatController,
          ),

          SizedBox(height: 60),

          Container(
            child: TextFormField(
              decoration: AppInputDecoration.inputDecoration.copyWith(
                labelText: AppStrings.synopsis,
              ),
              maxLines: 3,
              controller: synopsisController,
            ),
            width: 500,
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () async {
            final bookProvider = Provider.of<BookProvider>(
              context,
              listen: false,
            );
            await bookProvider.sendBookToFirestore(
              pages: pagesController.text,
              publicationDate: publicationDateController.text,
              title: titleController.text,
              author: authorController.text,
              gender: genderController.text,
              format: formatController.text,
              synopsis: synopsisController.text,
            );
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.add),
        ),
      ],
      backgroundColor: AppColors.paper,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50), //.zero,
        //side: BorderSide(width: 6),
      ),
    );
  }
}
