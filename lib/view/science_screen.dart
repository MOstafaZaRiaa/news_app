import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:news_app/core/view_model/science_screen_view_model.dart';
import 'package:news_app/widgets/article_builder.dart';
import 'package:news_app/widgets/news_item.dart';
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScienceScreenViewModel>(
      init: ScienceScreenViewModel(),
      builder: (controller)=> Center(
        child: controller.isLoading.value ? CircularProgressIndicator():
            articleBuilder(controller.science)
      ),
    );
  }
}
