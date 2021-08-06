import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/constance.dart';

import 'core/services/dio_helper.dart';
import 'core/view_model/main_screen_view_model.dart';
import 'my_home_page.dart';

void main() async{
  await GetStorage.init();
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenViewModel>(
      init: MainScreenViewModel(),
      builder: (controller) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NEWS APP',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: controller.isDark.value ? ThemeMode.dark :ThemeMode.light,
        home: MyHomePage(),
      ),
    );
  }
}
