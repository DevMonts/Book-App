import 'package:book_app/common/constants/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppStarsWidget extends StatefulWidget {
  final int numberOfStars; //4- Receipt
  final ValueChanged<int> onRatingUpdate;
  const AppStarsWidget({
    super.key,
    required this.numberOfStars, //3- Requires receipt
    required this.onRatingUpdate,
  });

  @override
  State<AppStarsWidget> createState() => _AppStarsWidgetState();
}

class _AppStarsWidgetState extends State<AppStarsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 67,
        child: AppCard(
          child: Center(
            child: RatingBar.builder(
              itemPadding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              itemSize: 24,
              initialRating: 3,
              minRating: 1,
              itemCount: 5,
              itemBuilder:
                  (
                    context,
                    _,
                  ) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
              onRatingUpdate:
                  (
                    rating,
                  ) {
                    widget.onRatingUpdate(
                      rating.toInt(),
                    );
                  },
            ),
          ),
        ),
      ),
    );
  }
}
