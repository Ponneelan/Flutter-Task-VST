import 'package:flutter/material.dart';

class GetWidget extends ChangeNotifier {
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  changeSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
