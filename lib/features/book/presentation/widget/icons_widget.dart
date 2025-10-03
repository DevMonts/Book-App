import 'package:book_app/common/constants/app_card.dart';
import 'package:book_app/features/book/repositories/icons_repository.dart';
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
    final iconsRepository = IconsRepository();

    return Column(
      children: [
        Text(
          'Ícone mostrado na lombada do livro',
        ),
        AppCard(
          child: SizedBox(
            height: 100,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: iconsRepository.iconsList.length,
              itemBuilder:
                  (
                    context,
                    index,
                  ) {
                    bool isSelected =
                        widget.selectedIcon ==
                        iconsRepository.iconsList[index]['string'];
                    return GestureDetector(
                      onTap: () {
                        widget.onIconSelected(
                          isSelected
                              ? null
                              : iconsRepository.iconsList[index]['string'],
                        );
                      },
                      child: Icon(
                        iconsRepository.iconsList[index]['icon'],
                        color:
                            widget.selectedIcon ==
                                iconsRepository.iconsList[index]['string']
                            ? [
                                //TODO: change to icon colors repository
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
        ),
      ],
    );
  }
}
