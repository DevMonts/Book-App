import 'package:book_app/common/constants/app_card.dart';
import 'package:flutter/cupertino.dart';

class PagesNumberWidget extends StatefulWidget {
  //4- Receive
  final int currentPage;
  final int pages;

  final ValueChanged<int> onCurrentPageChanged;
  final ValueChanged<int> onPagesChanged;

  const PagesNumberWidget({
    super.key,
    //3- Requires receipt
    required this.currentPage,
    required this.pages,

    required this.onCurrentPageChanged,
    required this.onPagesChanged,
  });

  @override
  State<PagesNumberWidget> createState() => _PagesNumberWidgetState();
}

class _PagesNumberWidgetState extends State<PagesNumberWidget> {
  @override
  Widget build(BuildContext context) {
    final currentPage = widget.currentPage;

    final pages = widget.pages;
    final remainPages = pages - currentPage;
    //TODO: percentage
    return AppCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 50,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: currentPage - 1,
                  ),
                  itemExtent: 30,
                  onSelectedItemChanged: (index) {
                    widget.onCurrentPageChanged(index + 1);
                  },
                  children: List<Widget>.generate(
                    2000,
                    (index) => Center(
                      child: Text(
                        '${index + 1}',
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '/',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 100,
                width: 50,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: pages - 1,
                  ),
                  itemExtent: 30,
                  onSelectedItemChanged: (index) {
                    widget.onPagesChanged(index + 1);
                  },
                  children: List<Widget>.generate(
                    2000,
                    (index) => Center(
                      child: Text(
                        '${index + 1}',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            '$currentPage página(s) lida(s) de $pages página(s) no total.',
            textAlign: TextAlign.center,
          ),
          Text(
            'Restam $remainPages página(s) para terminar o livro.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
