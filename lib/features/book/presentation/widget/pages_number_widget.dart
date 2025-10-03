import 'package:book_app/common/constants/app_card.dart';
import 'package:book_app/common/constants/app_number_picker.dart';
import 'package:flutter/material.dart';

class PagesNumberWidget extends StatefulWidget {
  final String thousands;
  final String hundred;
  final String ten;
  final String unit;
  final ValueChanged<int> onFirstNumberSelected;
  final ValueChanged<int> onSecondNumberSelected;
  final ValueChanged<int> onThirdNumberSelected;
  final ValueChanged<int> onFourthNumberSelected;

  const PagesNumberWidget({
    super.key,
    required this.thousands,
    required this.hundred,
    required this.ten,
    required this.unit,
    required this.onFirstNumberSelected,
    required this.onSecondNumberSelected,
    required this.onThirdNumberSelected,
    required this.onFourthNumberSelected,
  });

  @override
  State<PagesNumberWidget> createState() => _PagesNumberWidgetState();
}

class _PagesNumberWidgetState extends State<PagesNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Páginas',
        ),
        AppCard(
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Icon(
                  Icons.height,
                ),
                Expanded(
                  child: AppNumberPicker(
                    number: widget.thousands,
                    onSelectedItemChanged: widget.onFirstNumberSelected
                  ),
                ),
                Expanded(
                  child: AppNumberPicker(
                    number: widget.hundred,
                    onSelectedItemChanged: widget.onSecondNumberSelected
                  ),
                ),
                Expanded(
                  child: AppNumberPicker(
                    number: widget.ten,
                    onSelectedItemChanged: widget.onThirdNumberSelected
                  ),
                ),
                Expanded(
                  child: AppNumberPicker(
                    number: widget.unit, //TODO: start with 1
                    onSelectedItemChanged: widget.onFourthNumberSelected
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
