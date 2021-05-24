import 'dart:convert' as convert;
import 'package:basic_app/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<NewsModel>> fetchNews(int page) async {
    var url = Uri.parse(
        'https://hn.algolia.com/api/v1/search?tags=story,author_pg&page=$page');

    http.Response res = await http.get(url);
    var jsonResponse = convert.jsonDecode(res.body);
    return jsonResponse['hits']
        .map<NewsModel>((e) => NewsModel.fromJson(e))
        .toList();
  }
}
