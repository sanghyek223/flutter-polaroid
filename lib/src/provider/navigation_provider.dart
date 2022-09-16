import 'package:flutter/material.dart';

// ChangeNotifier 상속 받이 상태 관리
// BottomNavigation을 구동
class NavigationProvider extends ChangeNotifier {
  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  selectIndexUpdate(int index) {
    _selectIndex = index;
    notifyListeners();
  }
}
