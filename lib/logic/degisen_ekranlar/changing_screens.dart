import 'package:flutter/foundation.dart';

class ChangingScreensProvider extends ChangeNotifier {
  int _index = 1;
  int prevIndex = 1;

  int get index => _index;

  ChangingScreensProvider();

  void onChangedTab(int index) {
    _index = index;
    notifyListeners();
  }

  void onChangedButton(int index) {
    if (index > 0) {
      _index = 1;
      notifyListeners();
    }
  }

  void onChange(int index) {
    prevIndex = _index;
    _index = index;
    notifyListeners();
  }
}