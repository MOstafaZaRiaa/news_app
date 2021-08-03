import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/view/business_screen.dart';
import 'package:news_app/view/science_screen.dart';
import 'package:news_app/view/sports_screen.dart';

class MainScreenViewModel extends GetxController {
  final box = GetStorage();

  ValueNotifier<bool> _isDark = ValueNotifier(false);
  ValueNotifier<bool> get isDark => _isDark;

  List<BottomNavigationBarItem> _bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_rounded), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_rounded), label: 'Science'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_soccer_rounded), label: 'Sports'),
  ];
  List<BottomNavigationBarItem> get bottomItems => _bottomItems;

  List<Widget> _screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];
  List<Widget> get screens => _screens;

  int _currentScreenIndex = 0;
  int get currentScreenIndex => _currentScreenIndex;

  MainScreenViewModel(){
    getCurrentTheme();
  }

  changeCurrentScreen(int index) {
    _currentScreenIndex = index;
    update();
  }
  setCurrentTheme() {
    _isDark.value = !_isDark.value;
    box.write('theme', _isDark.value);
    update();
  }

  getCurrentTheme() {
    if(box.read('theme') == null ){
      _isDark.value = false;
    }else{
      _isDark.value =box.read('theme');
    }
    update();
  }
}
