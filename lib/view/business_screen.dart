import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/view_model/business_screen_view_model.dart';
import 'package:news_app/widgets/article_builder.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessScreenViewModel>(
      init: BusinessScreenViewModel(),
      builder: (controller)=> Center(
        child: controller.isLoading.value ? CircularProgressIndicator():
        articleBuilder(controller.business),
      ),
    );
  }
}
