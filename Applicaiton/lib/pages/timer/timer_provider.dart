import 'package:flutter/cupertino.dart';

class TimerProvider with ChangeNotifier {
  Duration _time = const Duration( seconds: 0);

  setTimer(String text) {
    _time = getDuration(text);
    notifyListeners();
  }

  Duration get timer => _time;

  Duration getDuration(String text) {
    if (text.isEmpty) {
      return const Duration( seconds: 0);
    }
    return Duration(seconds: int.parse(text));
  }
}