import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/core/services/dio_helper.dart';

class SearchScreenViewModel extends GetxController {
  ValueNotifier<bool> _isLoading = ValueNotifier(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  List<dynamic> _search = [];

  List<dynamic> get search => _search;


  void getSearch(String searchTitle) {
    _search = [];
    _isLoading.value = true;
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$searchTitle',
        'apiKey': '8ec6d2333cc44371b91ecb71b188ce16',
      },
    ).then((value) {
      _search = value.data['articles'];
      _isLoading.value = false;
      update();
    }).catchError((error) {
      print(error.toString());
    });
  }
}
