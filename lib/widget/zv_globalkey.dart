import 'package:flutter/material.dart';

/// 应该场景如：需求“点击A子组件，修改B子组件的背景颜色为指定的‘蓝色”

class GlobalKeyPage extends StatefulWidget {
  GlobalKeyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  GlobalKeyPageState createState() => GlobalKeyPageState();
}

/// 目的是：点击父部件的floatingActionButton，会通过给子部件传参的GlobalKey调用子部件的scrollToTop方法。
/// 注意：这里是调用方法！！！
class GlobalKeyPageState extends State<GlobalKeyPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _tabs = [];
  List<Widget> _tabViews = [];

  // GlobalKey 数组，存储每个 _MyTabBarViewState 的 key：
  List<GlobalKey<_MyTabBarViewState>> _tabViewKeys =
      new List<GlobalKey<_MyTabBarViewState>>();

  @override
  void initState() {
    super.initState();
    _tabs.add(Text('综合'));
    _tabs.add(Text('鞋帽'));
    _tabs.add(Text('女装'));

    _tabs.forEach((tab) {
      // 为每个_MyTabBarViewState 创建 GlobalKey
      GlobalKey<_MyTabBarViewState> key = new GlobalKey<_MyTabBarViewState>();
      _tabViewKeys.add(key);
      // 创建 MyTabBarView 时传入 key
      _tabViews.add(MyTabBarView(key: key));
    });

    _tabController = new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: Center(
        child: TabBarView(
          children: _tabViews,
          controller: _tabController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 父组件的按钮，点击时调用子组件的 scrollToTop() 方法
          // 先获取索引
          int index = _tabController.index;
          // 取对应的key
          GlobalKey<_MyTabBarViewState> key = _tabViewKeys[index];
          // 获取 _MyTabBarViewState 实例并调用方法：
          key.currentState.scrollToTop();
        },
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}

// 页面
class MyTabBarView extends StatefulWidget {
  // 构造函数中定义 Key 属性
  MyTabBarView({Key key}) : super(key: key);

  @override
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = new ScrollController();

  void scrollToTop() {
    _scrollController.jumpTo(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1 / 2,
      children: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((v) {
        return new Card(
            child: Column(
          children: <Widget>[
            Image.network(
                'http://pic27.nipic.com/20130313/9252150_092049419327_2.jpg'),
            Text(v.toString())
          ],
        ));
      }).toList(),
      controller: _scrollController,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
