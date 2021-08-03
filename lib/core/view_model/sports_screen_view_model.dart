import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/core/services/dio_helper.dart';

class SportsScreenViewModel extends GetxController {
  ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  List<dynamic> _sports = [];
  List<dynamic> get sports => _sports;

  SportsScreenViewModel(){
    getSports();
  }
  void getSports() {
    _isLoading.value =  true;
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'sports',
      'apiKey':'8ec6d2333cc44371b91ecb71b188ce16',
    }).then((value) {
      _sports = value.data['articles'];
      _isLoading.value =  false;
      update();
    }).catchError((error){
      print(error.toString());
    });
  }

}
