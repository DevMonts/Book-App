import 'package:book_app/common/constants/app_text_form_field.dart';
import 'package:flutter/material.dart';

class FieldsWidget extends StatelessWidget {
  final TextEditingController authorController;
  final TextEditingController genderController;
  final TextEditingController reviewController;
  const FieldsWidget({
    super.key,
    required this.authorController,
    required this.genderController,
    required this.reviewController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 3,
              child: AppTextFormField(
                hintText: 'Autor',
                controller: authorController,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Flexible(
              flex: 2,
              child: AppTextFormField(
                hintText: 'Gênero',
                controller: genderController,
              ),
            ),
          ],
        ),

        AppTextFormField(
          controller: reviewController,
          hintText: 'Resenha',
          maxLines: 10,
          height: 300,
        ),
      ],
    );
  }
}
