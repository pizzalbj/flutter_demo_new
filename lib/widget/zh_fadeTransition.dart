import 'package:flutter/material.dart';
import 'package:flutter_demo_new/fadeTransition.dart';

class FadeTransitionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('fadeTransition'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("first"),
              new MyFadeIn(
                  child: new Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: new Text("MyFadeIn"),
              )),
              new Text("two"),
            ],
          ),
        ),
      ),
    );
  }
}
