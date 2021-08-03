import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

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
        theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.black,
            ),
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(color: Colors.teal),
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Color(0xFF333739),
          iconTheme: IconThemeData(color: Colors.white),
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xFF333739),
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Color(0xFF333739),
            ),
            color: Color(0xFF333739),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF333739),
            selectedIconTheme: IconThemeData(color: Colors.teal),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
        ),
        themeMode: controller.isDark.value ? ThemeMode.dark :ThemeMode.light,
        home: MyHomePage(),
      ),
    );
  }
}
