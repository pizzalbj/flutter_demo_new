import 'package:flutter/material.dart';

class RaisedButtonWidthHeightPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RaisedButtonWidthHeightPageState();
}

class RaisedButtonWidthHeightPageState
    extends State<RaisedButtonWidthHeightPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("RaisedButton"),
      ),
      body: new Center(
        child: new Container(
          width: 60.0,
          child: new RaisedButton(
            color: Colors.red,
            child: new Text("RaisedButton 设置宽度"),
            onPressed: () {
              print("click");
            },
          ),
        ),
      ),
    );
  }
}
