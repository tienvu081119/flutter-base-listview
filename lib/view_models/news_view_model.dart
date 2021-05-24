import 'package:basic_app/base/base_list_model.dart';
import 'package:basic_app/data/repository/news_repository.dart';
import 'package:basic_app/models/news_model.dart';

class NewsViewModel extends BaseListModel {
  NewsRepository _newsRepository = NewsRepository();
  List<NewsModel> news = [];
  bool isLoading = false;
  int page = 0;

  Future fetchNews() async {
    int page = 0;
    setLoading(true);
    news = await _newsRepository.fetchNews(page);
    setLoading(false);
  }

  void onRefresh() async {
    int page = 0;
    news = await _newsRepository.fetchNews(page);
    notifyListeners();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    int newPage = page + 1;
    var newsData = await _newsRepository.fetchNews(newPage);
    news = [...news, ...newsData];
    notifyListeners();
    refreshController.loadComplete();
  }

  void initState() {
    this.fetchNews();
  }
}
