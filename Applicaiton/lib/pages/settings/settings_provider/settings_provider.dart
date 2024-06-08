import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier {
  String? selected = 'Default';
  final List<String> items = ["Light", "Dark"];
  String theme = 'Default';
  changeTheme(String theme) {
    this.theme = theme;
    selected = theme;
    notifyListeners();
  }
}