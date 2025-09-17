import 'package:book_app/common/constants/app_card.dart';
import 'package:flutter/cupertino.dart';

class PagesNumberWidget extends StatefulWidget {
  final TextEditingController currentPageController;
  final TextEditingController pagesController;
  const PagesNumberWidget({
    super.key,
    required this.currentPageController,
    required this.pagesController,
  });

  @override
  State<PagesNumberWidget> createState() => _PagesNumberWidgetState();
}

class _PagesNumberWidgetState extends State<PagesNumberWidget> {
  @override
  Widget build(BuildContext context) {
    final remainPages =
        int.parse(
          widget.pagesController.text,
        ) -
        int.parse(
          widget.currentPageController.text,
        );
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
                  itemExtent: 30,
                  onSelectedItemChanged: (index) {
                    final currentPage = (index + 1).toString();
                    setState(() {
                      widget.currentPageController.text = currentPage;
                    });
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
                  itemExtent: 30,
                  onSelectedItemChanged: (index) {
                    final pages = (index + 1).toString();
                    setState(() {
                      widget.pagesController.text = pages;
                    });
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
            '${widget.currentPageController.text} página(s) lida(s) de ${widget.pagesController.text} página(s) no total.',
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
