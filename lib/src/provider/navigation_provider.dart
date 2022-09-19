import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  selectIndexUpdate(int index) {
    _selectIndex = index;
    notifyListeners();
  }
}
