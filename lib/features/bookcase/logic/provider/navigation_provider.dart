import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int currentIndex = 0;
  PageController pageController = PageController();
  void changeBookcase(
    selectedIndex,
  ) {
    currentIndex = selectedIndex;
    pageController.animateToPage(
      selectedIndex,
      duration: Duration(
        microseconds: 1,
      ),
      curve: Curves.linear,
    );
    notifyListeners();
  }
}
