import 'package:book_app/common/constants/app_colors.dart';
import 'package:book_app/common/constants/app_input_decoration.dart';
import 'package:book_app/common/constants/app_strings.dart';
import 'package:flutter/material.dart';

class RegisterBookDialog extends StatelessWidget {
  const RegisterBookDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: TextField(
              decoration: AppInputDecoration.inputDecoration.copyWith(
                labelText: AppStrings.publicationDate,
              ),
              keyboardType: TextInputType.datetime,
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
          ),
          SizedBox(height: 40),
          TextFormField(
            decoration: AppInputDecoration.inputDecoration.copyWith(
              labelText: AppStrings.author,
            ),
          ),
          SizedBox(height: 40),
          TextFormField(
            decoration: AppInputDecoration.inputDecoration.copyWith(
              labelText: AppStrings.gender,
            ),
          ),
          SizedBox(height: 40),
          TextFormField(decoration: AppInputDecoration.inputDecoration),
          SizedBox(height: 60),

          Container(
            child: TextFormField(
              decoration: AppInputDecoration.inputDecoration.copyWith(
                labelText: AppStrings.synopsis,
              ),
              maxLines: 3,
            ),
            width: 500,
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
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
