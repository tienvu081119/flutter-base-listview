import 'package:basic_app/configs/color.dart';
import 'package:basic_app/models/news_model.dart';
import 'package:basic_app/ui/news/detail_news.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final NewsModel model;

  const NewsItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()=> Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailNews(newsModel: model))
      ),
      title: Text(
        '${model.title}',
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 24, color: Colors.grey),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            model.url != ''
                ? Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text("T",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Flexible(
                          child: Text('${model.url}',
                              overflow: TextOverflow.ellipsis))
                    ],
                  )
                : SizedBox(),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text("${model.points}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Text('by'),
                SizedBox(width: 4),
                Text(
                  '${model.author}',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Text('${model.created.toString()}')
              ],
            ),
          ],
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            padding: EdgeInsets.all(10),
            child: Text(
              '20',
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
