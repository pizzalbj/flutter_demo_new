import 'dart:math';

import 'package:flutter/material.dart';

class SetStateWidgetRebuildPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetStateWidgetRebuildPageState();
}

// 经验证，只要setState，父 子 兄弟 widget 都会 rebuild
class _SetStateWidgetRebuildPageState extends State<SetStateWidgetRebuildPage> {
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("widget setState rebuild"),
      ),
      body: new Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
            Random().nextInt(256), 1),
        child: new Column(
          children: <Widget>[
            new Container(
              color: Color.fromRGBO(Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256), 1),
              width: 120.0,
              height: 88.0,
              child: new Center(
                child: new Text("兄弟"),
              ),
            ),
            new Container(
              color: color,
              width: 120.0,
              height: 88.0,
              child: new Center(
                child: new Container(
                  color: Color.fromRGBO(Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256), 1),
                  child: new Text("子"),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Text("change"),
        onPressed: () {
          setState(() {
            color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
                Random().nextInt(256), 1);
          });
        },
      ),
    );
  }
}
