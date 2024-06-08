import 'package:flutter/cupertino.dart';

class HomeLayOutProvider extends ChangeNotifier  {
  int pageIndex = 0;
  void changePageIndex(int index, {required PageController pageController}) {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    pageIndex = index;
    notifyListeners();
  }
  void screenSwapped(int index) {
    pageIndex = index;
    notifyListeners();
  }
  get pageIndexValue => pageIndex;
}