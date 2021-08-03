import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/view_model/search_screen_view_model.dart';
import 'package:news_app/widgets/article_builder.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<SearchScreenViewModel>(
        init: SearchScreenViewModel(),
        builder: (controller) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: Theme.of(context).textTheme.headline1,
                  prefixIcon: Icon(Icons.search_rounded),
                  hintStyle: Theme.of(context).textTheme.headline1,
                  counterStyle: Theme.of(context).textTheme.headline1,
                  border: new OutlineInputBorder(
                    borderRadius:
                    new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                ),
                onChanged: (value){
                  controller.getSearch(value);
                },
                onSaved: (value) {
                  searchController.text = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'title must not be empty';
                  }
                  return null;
                },
              ),
            ),
            Expanded(child: articleBuilder(controller.search),),
          ],
        ),
      ),
    );
  }
}
