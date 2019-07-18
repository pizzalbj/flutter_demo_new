import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_demo_new/widget/webview_flutter/home_page.dart';
import 'package:flutter_demo_new/widget/webview_flutter/learning_page.dart';
import 'package:flutter_demo_new/widget/webview_flutter/user_page.dart';
import 'package:flutter_demo_new/widget/webview_flutter/parenting_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _tabIndex = 0;
  var _pageList = [
    new HomePage(),
    new LearningPage(),
    new ParentingPage(),
    new UserPage(),
  ];
  var _appBarList = [
    new AppBar(
      title: new Text("首页"),
    ),
    new AppBar(
      title: new Text("学育儿"),
    ),
    new AppBar(
      title: new Text("享育儿"),
      // backgroundColor: Colors.green,
    ),
    new AppBar(
      title: new Text("我的"),
    )
  ];

  var _appBarTitles = ['首页', '学育儿', '享育儿', '我的'];
  var _tabImages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(
        _appBarTitles[curIndex],
        style: new TextStyle(
          fontSize: 14.0,
          color: Theme.of(context).primaryColor,
        ),
      );
    } else {
      return new Text(
        _appBarTitles[curIndex],
        style: new TextStyle(
          fontSize: 14.0,
          color: const Color(0xff515151),
        ),
      );
    }
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  void initData() {
    _tabImages = [
      [
        getTabImage('static/images/index_gray.png'),
        getTabImage('static/images/index_colours.png')
      ],
      [
        getTabImage('static/images/learn_gray.png'),
        getTabImage('static/images/learn_colours.png')
      ],
      [
        getTabImage('static/images/enjoyment_gray.png'),
        getTabImage('static/images/enjoyment_colours.png')
      ],
      [
        getTabImage('static/images/user_gray.png'),
        getTabImage('static/images/user_colours.png')
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
      appBar: _appBarList[_tabIndex],
      // IndexedStack 修改为 Container(body: _pageList[_tabIndex]) 的话，则不会保存页面状态
      body: IndexedStack(
        index: _tabIndex,
        children: _pageList,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            title: getTabTitle(0),
            icon: getTabIcon(0),
          ),
          new BottomNavigationBarItem(
            title: getTabTitle(1),
            icon: getTabIcon(1),
          ),
          new BottomNavigationBarItem(
            title: getTabTitle(2),
            icon: getTabIcon(2),
          ),
          new BottomNavigationBarItem(
            title: getTabTitle(3),
            icon: getTabIcon(3),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            print(index);
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
