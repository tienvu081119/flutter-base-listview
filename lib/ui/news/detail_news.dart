import 'package:basic_app/models/news_model.dart';
import 'package:flutter/material.dart';

class DetailNews extends StatelessWidget {
  final NewsModel newsModel;

  const DetailNews({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${newsModel.title}', overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
