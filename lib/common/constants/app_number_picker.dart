import 'package:flutter/cupertino.dart';

class AppNumberPicker extends StatefulWidget {
  final String number;
  final ValueChanged<int> onSelectedItemChanged;
  const AppNumberPicker({
    super.key,
    required this.number,
    required this.onSelectedItemChanged,
  });

  @override
  State<AppNumberPicker> createState() => _AppNumberPickerState();
}

class _AppNumberPickerState extends State<AppNumberPicker> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: widget.onSelectedItemChanged,
      children: List.generate(
        10,
        (index) => Center(
          child: Text(
            index.toString(),
          ),
        ),
      ),
    );
  }
}
