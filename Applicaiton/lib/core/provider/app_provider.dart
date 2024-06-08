import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppProvider extends ChangeNotifier {

  int pageIndex = 0;
  void changePageIndex(int index, {required PageController pageController}) {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    pageIndex = index;
    notifyListeners();
  }
  void screenSwapped(int index) {
    if (pageIndex != index) {
      pageIndex = index;
      notifyListeners();
    }
  }
  get getPageIndexValue => pageIndex;
}

//-----------------------------------------------------------------------
class ThemeController extends GetxController {
  late String currentTheme = 'Default';
  RxBool isDarkMode = false.obs;
  ThemeData get themeData =>
      Get.isDarkMode ? ThemeData.dark() : ThemeData.light();

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeTheme(String theme) {
    Get.changeThemeMode(theme == "Dark" ? ThemeMode.dark : ThemeMode.light);
    currentTheme = theme;
    update();
  }
}