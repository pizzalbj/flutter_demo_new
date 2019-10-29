import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/data/model/news_model.dart';

class UserRepository {
  static Future<List<NewsModel>> getNews(int page, int pageSize) async {
    await new Future.delayed(new Duration(milliseconds: 1000));
    if (page < 4) {
      return [
        new NewsModel(1, "content"),
        new NewsModel(1, "content"),
        new NewsModel(1, "content"),
        new NewsModel(1, "content"),
        new NewsModel(1, "content"),
        new NewsModel(1, "content"),
        new NewsModel(1, "content"),
        new NewsModel(1, "content"),
        new NewsModel(1, "content"),
        new NewsModel(1, "content"),
      ];
    } else {
      return [];
    }
  }
}
