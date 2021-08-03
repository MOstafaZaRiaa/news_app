import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/view/search_screen.dart';

import 'core/view_model/main_screen_view_model.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenViewModel>(
      init: MainScreenViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setCurrentTheme();
              },
              icon: Icon(
                Icons.brightness_4_outlined,
              ),
            ),
          ],
        ),
        body: controller.screens[controller.currentScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentScreenIndex,
          items: controller.bottomItems,
          onTap: (index) {
            controller.changeCurrentScreen(index);
          },
        ),
      ),
    );
  }
}
