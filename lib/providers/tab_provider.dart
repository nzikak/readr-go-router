import 'package:flutter/material.dart';

enum Tabs {
  explore,
  bookmarks,
  profile,
}

class TabProvider extends ChangeNotifier {
  Tabs _currentTab = Tabs.explore;

  Tabs get currentTab => _currentTab;

  void setCurrentTab(int index) {
    switch (index) {
      case 0:
        _currentTab = Tabs.explore;
        break;
      case 1:
        _currentTab = Tabs.bookmarks;
        break;
      case 2:
        _currentTab = Tabs.profile;
        break;
      default:
        throw Exception("Not a valid tab");
    }
    notifyListeners();
  }
}
