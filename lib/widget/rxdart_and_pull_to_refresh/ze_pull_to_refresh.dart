import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/blocs/main_bloc.dart';
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/blocs/bloc_provider.dart';
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/data/model/news_model.dart';

import 'data/model/status_event.dart';

String bbsList = "bbs_List";

// StateFulWidget 会 lose 更新的 status
class PullToRefreshPage extends StatelessWidget {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);

    bloc.homeEventStream.listen((event) {
      print(event.status);
      switch (event.status) {
        case RefreshAndLoadingStatus.idle:
          _refreshController.refreshCompleted();
          _refreshController.loadComplete();
          break;
        case RefreshAndLoadingStatus.noMore:
          _refreshController.loadNoData();
          break;
        default:
          _refreshController.refreshCompleted();
          _refreshController.loadComplete();
      }
    });

    Observable.just(1).delay(new Duration(milliseconds: 100)).listen((_) {
      bloc.onRefresh(labelId: bbsList);
    });

    return new Scaffold(
      key: new UniqueKey(),
      appBar: new AppBar(
        title: new Text("新闻列表"),
      ),
      body: new StreamBuilder(
        stream: bloc.newsListStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot) {
          return new SafeArea(
            child: new SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(),
              //  header: CustomHeader(
              //    builder: (BuildContext context, RefreshStatus mode) {
              //      Widget body;
              //      if (mode == RefreshStatus.idle) {
              //        body = Text("loading...");
              //      } else if (mode == RefreshStatus.refreshing) {
              //        body = CupertinoActivityIndicator();
              //      }
              //      return body;
              //    },
              //  ),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus mode) {
                  Widget body;
                  print("mode: $mode");
                  if (mode == LoadStatus.idle) {
                    body = Text("上拉加载");
                  } else if (mode == LoadStatus.loading) {
                    body = CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = Text("加载失败！点击重试！");
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text("松手,加载更多!");
                  } else {
                    body = Text("没有更多数据了!");
                  }
                  return Container(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              controller: _refreshController,
              onRefresh: () {
                bloc.onRefresh(labelId: bbsList);
              },
              onLoading: () {
                bloc.onLoadMore(labelId: bbsList);
              },
              child: new ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (c, i) => Card(
                  child: new Container(
                    height: 120.0,
                    child: new Text("${snapshot.data[i].content}: " + "$i"),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
