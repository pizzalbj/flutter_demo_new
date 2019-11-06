import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_demo_new/widget/zo_widget_not_rebuild_package.dart';

class WidgetShouldRebuildPage extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<WidgetShouldRebuildPage> {
  int parentNum = 0;
  int counter = 0;

  _incrementCounter() {
    setState(() {
      ++counter;
    });
  }

  _incrementProduct() {
    setState(() {
      ++parentNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Widget rebuild"),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              ShouldRebuild<Counter>(
                shouldRebuild: (oldWidget, newWidget) => oldWidget.counter != newWidget.counter,
                child: Counter(
                  counter: counter,
                  onClick: _incrementCounter,
                  title: '我是优化过的Counter',
                ),
              ),
              Counter(
                counter: counter,
                onClick: _incrementCounter,
                title: '我是未优化过的Counter',
              ),
              Text(
                'parentNum = $parentNum',
                style: TextStyle(fontSize: 22, color: Colors.deepOrange),
              ),
              RaisedButton(
                onPressed: _incrementProduct,
                child: Text('increment Product'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final String title;
  final int counter;
  final VoidCallback onClick;

  Counter({this.counter, this.onClick, this.title});

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: color,
      height: 150,
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'counter = ${this.counter}',
                style: TextStyle(fontSize: 43, color: Colors.white),
              ),
            ],
          ),
          RaisedButton(
            color: color,
            textColor: Colors.white,
            elevation: 20,
            onPressed: onClick,
            child: Text('increment Counter'),
          ),
        ],
      ),
    );
  }
}
