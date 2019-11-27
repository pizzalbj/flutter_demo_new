import 'package:flutter/material.dart';

const IMAGE_SRC = 'https://picsum.photos/id/142/600/400';

// http://www.ptbird.cn/flutter-customscrollview-floating-appbar.html#menu_index_1
class CustomScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  HomeContent({Key key}) : super(key: key);

  List _list = List.generate(20, (index) => 'Item - $index');

  Widget _builder(context, index) {
    return ListTile(title: Text(_list[index]));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('CustomScrollView'),
          backgroundColor: Colors.pink,
          // true: 当列表往下滑动时，会先将 SliverAppBar 浮动出现（与列表是否滚动到顶部无关）
          // false: 当列表往下滑动时，会先将列表内容滚动到顶部，然后再将 SliverAppBar 浮动出现
          floating: false,
          snap: false,
          // 属性能够决定是否将导航栏部分固定。true: 固定，false: 不固定
          pinned: true,
          // pinned 属性能够决定是否将导航栏部分固定 true: 固定，false: 不固定
          expandedHeight: 200,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Icon(Icons.list),
            ),
          ],
          flexibleSpace: Row(
            children: <Widget>[
              Expanded(
                child: Image.network(IMAGE_SRC, fit: BoxFit.cover),
              )
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _builder,
            childCount: _list.length,
          ),
        ),
      ],
    );
  }
}
