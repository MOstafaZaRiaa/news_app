import 'package:flutter/material.dart';

import 'news_item.dart';

Widget articleBuilder(articleList) {
  return ListView.separated(
    physics: BouncingScrollPhysics(),
    separatorBuilder: (context, index) => Divider(),
    itemCount: articleList.length,
    itemBuilder: (context, index) => NewsItem(newData: articleList[index]),
  );
}
