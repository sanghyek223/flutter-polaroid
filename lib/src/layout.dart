import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:polaroid/src/provider/navigation_provider.dart';

class Layout extends StatelessWidget {
  late NavigationProvider _navigationProvider;

  Widget _bodyWidget() {
    switch (_navigationProvider.currentPage) {
      case 0:
        return CountHomeWidget();

      case 1:
        return ListWidget();
    }
  }

  Widget _bottomWidget() {
    return BottomNavigationBar(
      currentIndex: _navigationProvider.currentPage,
      selectedItemColor: Colors.blue,
      onTap: (index) {
        _navigationProvider.updateCurrentPage(index);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Provider를 호출해 접근
    _navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomWidget(),
    );
  }
}
