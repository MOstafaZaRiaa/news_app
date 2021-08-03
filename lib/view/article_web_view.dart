import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  var url,title;

   ArticleWebView({this.url,this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),centerTitle: true,),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
