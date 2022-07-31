import 'package:flutter/material.dart';
import 'package:leftright/model/dogmodel.dart';
import 'package:leftright/model/jokomodel.dart';

class GetWidget extends ChangeNotifier {
  int _selectedIndex = 0;
  int _selectedWidget = 0;
  String _joke = '';
  String _link = '';
  int get currentIndex => _selectedIndex;
  int get currentWidget => _selectedWidget;
  String get Joke => _joke;
  String get Link => _link;

  changeSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  changeSelectedWidget(int value) {
    _selectedWidget = value;
    notifyListeners();
  }

  updateJoke(String value) {
    _joke = value;
    notifyListeners();
  }

  updatLink(String val) {
    _link = val;
    notifyListeners();
  }
}
