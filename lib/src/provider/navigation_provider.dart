import 'package:flutter/material.dart';

// ChangeNotifier 상속 받이 상태 관리
// BottomNavigation을 구동
class NavigationProvider extends ChangeNotifier {
  int _index = 0;
  int get currentPage => _index; // get 함수를 사용해 외부에서 접근이 가능하게 한다.

  // page 업데이트
  updateCurrentPage(int index) {
    _index = index; // updateCurrentPage를 통해 index 값을 받아와 _index 페이지로 바꿔준다.
    notifyListeners(); // notifyListeners 호출해 업데이트된 값을 구독자에게 알림
  }
}
