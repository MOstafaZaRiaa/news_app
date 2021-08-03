import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:news_app/core/view_model/sports_screen_view_model.dart';
import 'package:news_app/widgets/article_builder.dart';
import 'package:news_app/widgets/news_item.dart';
class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SportsScreenViewModel>(
      init: SportsScreenViewModel(),
      builder: (controller)=> Center(
        child: controller.isLoading.value ? CircularProgressIndicator():
        articleBuilder(controller.sports),
      ),
    );
  }
}
