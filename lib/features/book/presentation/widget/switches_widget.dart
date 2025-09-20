import 'package:book_app/common/constants/app_card.dart';
import 'package:book_app/common/constants/app_switch.dart';
import 'package:flutter/material.dart';

class SwitchesWidget extends StatefulWidget {
  //4- Receipt
  final bool isPaused;
  final bool isRereading;
  final bool isEbook;

  final ValueChanged<bool> onPausedChanged;
  final ValueChanged<bool> onRereadingChanged;
  final ValueChanged<bool> onEbookChanged;
  const SwitchesWidget({
    super.key,

    //3- Requires receipt
    required this.isPaused,
    required this.isRereading,
    required this.isEbook,

    required this.onPausedChanged,
    required this.onRereadingChanged,
    required this.onEbookChanged,
  });

  @override
  State<SwitchesWidget> createState() => _SwitchesWidgetState();
}

class _SwitchesWidgetState extends State<SwitchesWidget> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return AppCard(
      child: Column(
        children: [
          AppSwitch(
            text1: 'LENDO',
            text2: 'PAUSADO',
            icon1: Icons.play_arrow,
            icon2: Icons.pause,
            value: widget.isPaused,
            onChanged: widget.onPausedChanged,
          ),
          AppSwitch(
            text1: 'LEITURA',
            text2: 'RELEITURA',
            icon1: Icons.auto_stories,
            icon2: Icons.replay,
            value: widget.isRereading,
            onChanged: widget.onRereadingChanged,
          ),
          AppSwitch(
            text1: 'LIVRO',
            text2: 'EBOOK',
            icon1: Icons.book,
            icon2: Icons.tablet_android,
            value: widget.isEbook,
            onChanged: widget.onEbookChanged,
          ),
        ],
      ),
    );
  }
}
