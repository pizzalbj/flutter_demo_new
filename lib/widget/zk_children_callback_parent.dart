import 'package:flutter/material.dart';

class ChildToParentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ChildToParentPageState();
}

class ChildToParentPageState extends State<ChildToParentPage> {
  String str = "parent";

  callback(String value) {
    setState(() {
      str = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(str),
      ),
      body: new Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        child: new Column(
          children: <Widget>[
            new Text(str),
            new ChildTwo(
              callback: callback,
            ),
          ],
        ),
      ),
    );
  }
}

class ChildTwo extends StatelessWidget {
  Function callback;

  ChildTwo({this.callback});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new RaisedButton(
        child: new Text("callback"),
        onPressed: () {
          callback("children");
        },
      ),
    );
  }
}
