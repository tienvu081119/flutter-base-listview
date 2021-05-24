import 'package:basic_app/base/base_view.dart';
import 'package:basic_app/view_models/news_view_model.dart';
import 'package:basic_app/widgets/news_item.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../configs/color.dart';
import 'package:provider/provider.dart';

class ListNews extends StatefulWidget {
  _ListNews createState() => _ListNews();
}

class _ListNews extends State<ListNews> {
  NewsViewModel model = NewsViewModel();

  void iniState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      model: NewsViewModel(),
      builder: (_, model, Widget? child) {
        if (model.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!model.isLoading && model.news.length == 0) {
          return Center(
            child: Text('NoData'),
          );
        }
        return Scaffold(
            appBar: AppBar(
              title: Text('Hacker News'),
              backgroundColor: primaryColor,
            ),
            body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: model.refreshController,
              onLoading: model.onLoading,
              onRefresh: model.onRefresh,
              child: ListView.separated(
                  itemCount: model.news.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) =>
                      NewsItem(model: model.news.elementAt(index))),
            ));
      },
    );
  }
}

/*class ListNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsViewModel>(
      create: (_) => NewsViewModel(),
      child: Consumer<NewsViewModel>(
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Hacker News'),
                backgroundColor: primaryColor,
              ),
              body: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: model.refreshController,
                onLoading: model.onLoading,
                onRefresh: model.onRefresh,
                child: ListView.separated(
                    itemCount: model.news.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemBuilder: (BuildContext context, int index) =>
                        NewsItem(model: model.news.elementAt(index))),
              ));
        },
      ),
    );
  }
}*/
