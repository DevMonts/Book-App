import 'package:flutter/material.dart';

class PageNumberProvider extends ChangeNotifier {
  String thousands = '0';
  String hundred = '0';
  String ten = '0';
  String unit = '0';

  int get pages => int.parse(thousands + hundred + ten + unit);

  void setThousands(String thousands) {
    this.thousands = thousands;
    notifyListeners();
  }

  void setHundred(String hundred) {
    this.hundred = hundred;
    notifyListeners();
  }

  void setTen(String ten) {
    this.ten = ten;
    notifyListeners();
  }

  void setUnit(String unit) {
    this.unit = unit;
    notifyListeners();
  }
}
