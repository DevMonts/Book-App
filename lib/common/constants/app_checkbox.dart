import 'package:book_app/common/constants/app_card.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatefulWidget {
  final bool isInWishlist;
  final ValueChanged<bool> onChanged;
  final String text;
  const AppCheckbox({
    super.key,
    required this.isInWishlist,
    required this.onChanged,
    required this.text,
  });

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Checkbox(
            value: widget.isInWishlist,
            onChanged:
                (
                  value,
                ) {
                  widget.onChanged(
                    value!,
                  );
                },
          ),
          Text(
            widget.text,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
