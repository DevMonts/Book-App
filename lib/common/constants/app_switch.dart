import 'package:flutter/material.dart';

class AppSwitch extends StatefulWidget {
  final String text1;
  final String text2;
  final IconData icon1;
  final IconData icon2;
  final bool value;
  final ValueChanged<bool> onChanged;
  const AppSwitch({
    super.key,
    required this.text1,
    required this.text2,
    required this.icon1,
    required this.icon2,
    required this.value,
    required this.onChanged,
  });

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            widget.text1,
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          widget.icon1,
          color: Theme.of(
            context,
          ).colorScheme.onSurface,
        ),
        Switch(
          value: widget.value,
          onChanged: widget.onChanged,
        ),
        Icon(
          widget.icon2,
          color: Theme.of(
            context,
          ).colorScheme.primary,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            widget.text2,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
