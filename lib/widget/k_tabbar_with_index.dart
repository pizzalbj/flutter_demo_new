// https://insertbreakpoint.wordpress.com/2018/03/28/flutter-list-dialog-example/
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:numberpicker/numberpicker.dart';

class k_tabbar_with_index extends StatefulWidget {
  @override
  k_tabbar_with_index_state createState() => new k_tabbar_with_index_state();
}

class k_tabbar_with_index_state extends State<k_tabbar_with_index>
    with SingleTickerProviderStateMixin {
  List _items = [];

  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'LEFT'),
    new Tab(text: 'RIGHT'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
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
        bottom: new TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return new Center(child: new Text(tab.text));
        }).toList(),
      ),
    );
  }
}
