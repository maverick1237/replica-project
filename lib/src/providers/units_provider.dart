import 'package:flutter/material.dart';

class UnitsProvider with ChangeNotifier {
  String _searchedTitle = '';

  String get searchedTitle => _searchedTitle;

  void setSearchedTitle(String title) {
    _searchedTitle = title;
    notifyListeners();
  }
}
