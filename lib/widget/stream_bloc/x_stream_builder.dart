// https://www.jianshu.com/p/4d5e712594b4
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo_new/widget/w_animation.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

/// StreamController
/// StreamBuilder
/// StreamController.sink
class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  // todo: how to do with multi data.
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
          // 我们正在监听流，每次有一个新值流出这个流时，我们用该值更新Text ;
          child: new Column(
        children: <Widget>[
          StreamBuilder<int>(
            stream: _streamController.stream,
            initialData: _counter,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('You hit me: ${snapshot.data} times');
            },
          ),
          new RaisedButton(
            child: const Icon(Icons.add),
            onPressed: () {
              // 当我们点击FloatingActionButton时，增加计数器并通过sink将其发送到Stream；
              // 事实上 注入到stream中值会导致监听它(stream)的StreamBuilder重建并 ‘刷新’计数器;
              _streamController.sink.add(++_counter);
            },
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: new Text("goto"),
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(builder: (ctx) {
              return new AnimationButton(
                title: "我来了",
              );
            }),
          );
        },
      ),
    );
  }
}
