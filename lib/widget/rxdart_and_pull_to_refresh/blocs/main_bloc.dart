import 'dart:collection';

import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/data/model/status_event.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:rxdart/rxdart.dart';
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/blocs/bloc_index.dart';

import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/data/model/news_model.dart';
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/data/repository/user_repository.dart';

/// 获取新闻所有的相关
class Ids {
  static const String newsList = 'bbs_List';
}

class MainBloc implements BlocBase {
  /// **** **** 监听事件 **** ****
  /// asBroadcastStream: 监听广播流，可以监听下面的事件：如事件完成了
  BehaviorSubject<StatusEvent> _homeEvent = BehaviorSubject<StatusEvent>();

  Sink<StatusEvent> get homeEventSink => _homeEvent.sink;

  Stream<StatusEvent> get homeEventStream =>
      _homeEvent.stream.asBroadcastStream();

  /// **** **** 获取新闻 **** ****
  BehaviorSubject<List<NewsModel>> _news = BehaviorSubject<List<NewsModel>>();

  Stream<List<NewsModel>> get newsListStream => _news.stream;

  Sink<List<NewsModel>> get _newsListSink => _news.sink;

  List<NewsModel> _newsList = new List<NewsModel>();

  int _newsListPage = 1;

  Future getBbsList(String labelId, int page) async {
    await UserRepository.getNews(page, 10).then((data) async {
      if (page == 1) {
        _newsList.clear();
      }
      _newsList.addAll(data);
      _newsListSink.add(_newsList);

      print(page > 3);
      homeEventSink.add(new StatusEvent(
        labelId,
        page > 3
            ? RefreshAndLoadingStatus.noMore
            : RefreshAndLoadingStatus.idle,
      ));
    }).then((error) {});
  }

  @override
  Future<void> getData({String labelId, int id, int page}) async {
    switch (labelId) {
      case Ids.newsList:
        await getBbsList(labelId, page);
        break;
      default:
        return Future.delayed(new Duration(seconds: 1));
        break;
    }
  }

  @override
  Future onLoadMore({String labelId, int id}) async {
    int _page;
    switch (labelId) {
      case Ids.newsList:
        _page = ++_newsListPage;
        break;
      default:
        break;
    }
    getData(labelId: labelId, id: id, page: _page);
  }

  @override
  Future onRefresh({String labelId, bool isReload = false, int id}) async {
    switch (labelId) {
      case Ids.newsList:
        _newsListPage = 1;
        break;
      default:
        break;
    }
    getData(labelId: labelId, id: id, page: _newsListPage);
  }

  @override
  void dispose() {
    _homeEvent.close();
    _news.close();
  }
}
