import 'package:flutter/material.dart';
import 'package:marvin_app/ui/app/comics/comics_screen.dart';
import 'package:marvin_app/ui/app/home/home_screen_body.dart';
import 'package:marvin_app/ui/app/others/other_screen.dart';

class NavigationProvider with ChangeNotifier {
  int _index;
  List _pageList;

  int get index => _index;

  get currentPage => _pageList[index];

  setCurrentIndex(int index) {
    _index = index;
    notifyListeners();
  }

  NavigationProvider.initialize() {
    _index = 0;
    _pageList = [
      HomeScreenBody(),
      ComicsScreen(),
      OtherScreen(),
    ];
  }
}
