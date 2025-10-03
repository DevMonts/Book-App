import 'package:book_app/common/constants/app_card.dart';
import 'package:book_app/features/book/repositories/categories_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  final String? selectedCategory;
  final Function(
    String?,
  )
  setState;
  const CategoriesWidget({
    super.key,
    required this.selectedCategory,
    required this.setState,
  });

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final categoriesRepository = CategoriesRepository();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        10,
      ),
      child: Column(
        children: [
          Text(
            'Categoria',
          ),
          Expanded(
            child: AppCard(
              child: CupertinoPicker(
                itemExtent: 35,
                onSelectedItemChanged:
                    (
                      index,
                    ) {
                      widget.setState(
                        categoriesRepository.categories[index],
                      );
                    },
                diameterRatio: 10,
                scrollController: FixedExtentScrollController(
                  initialItem: 2,
                ),
                children: categoriesRepository.categories
                    .map(
                      (
                        category,
                      ) => Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                switch (category) {
                                  'Relendo' => Icons.replay,
                                  'Lido' => Icons.flag,
                                  'Lendo' => Icons.play_arrow,
                                  'Pausado' => Icons.pause,
                                  'Tenho mas ñ li' => Icons.shelves,
                                  'Quero ler' => Icons.shopping_cart,
                                  _ => null,
                                },
                              ),
                              Text(
                                category,
                                style: TextStyle(
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
