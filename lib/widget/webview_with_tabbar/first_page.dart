import 'package:flutter/material.dart';

import './recommend_page.dart';
import './vip_page.dart';
import './novel_page.dart';
import './live_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Widget> _myTabsView = <Widget>[
    new RecommendPage(),
    new VipPage(),
    new NovelPage(),
    new LivePage(),
  ];

  final List<Tab> _myTabs = <Tab>[
    new Tab(
      text: 'recommend',
      icon: new Icon(Icons.android),
    ),
    new Tab(
      text: 'vip',
      icon: new Icon(Icons.android),
    ),
    new Tab(
      text: 'novel',
      icon: new Icon(Icons.android),
    ),
    new Tab(
      text: 'live',
      icon: new Icon(Icons.android),
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: new Material(
        color: Colors.blueAccent,
        child: new TabBar(
          controller: _tabController,
          tabs: _myTabs,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.black,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: _myTabsView,
      ),
    );

    /// 自己实现 tabController
//    return new DefaultTabController(
//      length: _myTabs.length,
//      child: new Column(
//        children: <Widget>[
//          new Expanded(
//            child: TabBarView(
//              children: _myTabs.map((Tab tab) {
//                return new Center(child: new Text(tab.text));
//              }).toList(),
//              // physics: NeverScrollableScrollPhysics(), // 禁止滑动
//            ),
//          ),
//          new Container(
//              width: double.infinity,
//              height: 80,
//              padding: EdgeInsets.fromLTRB(20, 24, 0, 0),
//              alignment: Alignment.centerLeft,
//              color: Colors.black,
//              child: new Material(
//                child: TabBar(
//                  isScrollable: true,
//                  indicatorColor: Colors.red,
//                  indicatorSize: TabBarIndicatorSize.label,
//                  unselectedLabelColor: Colors.blue,
//                  unselectedLabelStyle: TextStyle(fontSize: 18),
//                  labelColor: Colors.red,
//                  labelStyle: TextStyle(fontSize: 20),
//                  tabs: _myTabs,
//                ),
//              ))
//        ],
//      ),
//    );

    /// 还可以通过 pageView() 实现
  }
}
