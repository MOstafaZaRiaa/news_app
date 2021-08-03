import 'package:get/get.dart';
import 'package:news_app/core/view_model/business_screen_view_model.dart';
import 'package:news_app/core/view_model/main_screen_view_model.dart';
import 'package:news_app/core/view_model/science_screen_view_model.dart';
import 'package:news_app/core/view_model/search_screen_view_model.dart';
import 'package:news_app/core/view_model/sports_screen_view_model.dart';



class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenViewModel(),);
    Get.lazyPut(() => BusinessScreenViewModel(),);
    Get.lazyPut(() => SportsScreenViewModel(),);
    Get.lazyPut(() => ScienceScreenViewModel(),);
    Get.lazyPut(() => SearchScreenViewModel(),);
  }

}