import 'package:flutter/material.dart';
import 'package:news_app/view/article_web_view.dart';

class NewsItem extends StatelessWidget {
  final newData;

  NewsItem({this.newData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleWebView(url : newData['url'],title: newData['title'],),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            newData['urlToImage']==null ?  Container(
          width: size.width * .25,
          height: size.height * .15,
          child: Center(child: Text('No Image',style: Theme.of(context).textTheme.headline1,),),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              border: Border.all(),
          ),
        ) :
            Container(
              width: size.width * .25,
              height: size.height * .15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '${newData['urlToImage']}'),
                ),
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${newData['title']}',
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                      '${newData['publishedAt']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
