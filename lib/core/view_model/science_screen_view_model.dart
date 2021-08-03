import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/core/services/dio_helper.dart';

class ScienceScreenViewModel extends GetxController {
  ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  List<dynamic> _science = [];
  List<dynamic> get science => _science;

  ScienceScreenViewModel(){
    getScience();
  }
  void getScience() {
    _isLoading.value =  true;
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'science',
      'apiKey':'8ec6d2333cc44371b91ecb71b188ce16',
    }).then((value) {
      _science = value.data['articles'];
      _isLoading.value =  false;
       update();

    }).catchError((error){
      print(error.toString());
    });
  }

}
