import 'package:flutter/material.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.value,
    required this.onChanged,
  });
  final IconData icon1;
  final IconData icon2;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
      ],
    );
  }
}
