import 'package:book_app/common/constants/app_card.dart';
import 'package:flutter/material.dart';

class IconsWidget extends StatefulWidget {
  final String? selectedIcon;
  final Function(
    String?,
  )
  onIconSelected;
  const IconsWidget({
    super.key,
    required this.selectedIcon,
    required this.onIconSelected,
  });

  @override
  State<IconsWidget> createState() => _IconsWidgetState();
}

class _IconsWidgetState extends State<IconsWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> iconsList = [
      {'string': 'ac_unit', 'icon': Icons.ac_unit},
      {
        'string': 'anchor',
        'icon': Icons.anchor,
      },
      {
        'string': 'brightness_3',
        'icon': Icons.brightness_3,
      },
      {
        'string': 'church',
        'icon': Icons.church,
      },
      {
        'string': 'cloud',
        'icon': Icons.cloud,
      },
      {
        'string': 'cottage',
        'icon': Icons.cottage,
      },
      {
        'string': 'deck',
        'icon': Icons.deck,
      },
      {
        'string': 'delete',
        'icon': Icons.delete,
      },
      {
        'string': 'electric_bolt',
        'icon': Icons.electric_bolt,
      },
      {
        'string': 'explore',
        'icon': Icons.explore,
      },
      {
        'string': 'favorite',
        'icon': Icons.favorite,
      },
      {
        'string': 'heart_broken',
        'icon': Icons.heart_broken,
      },
      {
        'string': 'local_fire_department',
        'icon': Icons.local_fire_department,
      },
      {
        'string': 'local_florist',
        'icon': Icons.local_florist,
      },
      {
        'string': 'local_pizza',
        'icon': Icons.local_pizza,
      },
      {
        'string': 'sunny',
        'icon': Icons.sunny,
      },
    ];

    return AppCard(
      child: SizedBox(
        height: 100,
        child: GridView.builder(
          itemCount: iconsList.length,
          itemBuilder:
              (
                context,
                index,
              ) {
                bool isSelected =
                    widget.selectedIcon == iconsList[index]['string'];
                return GestureDetector(
                  onTap: () {
                    widget.onIconSelected(
                      isSelected ? null : iconsList[index]['string'],
                    );
                  },
                  child: Icon(
                    iconsList[index]['icon'],
                    color: widget.selectedIcon == iconsList[index]['string']
                        ? [
                            Colors.cyanAccent,
                            Colors.grey,
                            Colors.yellow,
                            Colors.white,
                            Colors.white,
                            Colors.orange,
                            Colors.brown,
                            Colors.grey,
                            Colors.yellow,
                            Colors.grey,
                            Colors.red,
                            Colors.red,
                            Colors.orange,
                            Colors.pink,
                            Colors.yellow,
                            Colors.yellow,
                          ][index]
                        : Theme.of(
                            context,
                          ).colorScheme.surface,
                  ),
                );
              },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
          ),
        ),
      ),
    );
  }
}
