import 'package:flutter/material.dart';

class TOnlyColumn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TOnlyColumnState();
  }
}

class TOnlyColumnState extends State<TOnlyColumn> {
  renderColumn() {
    List<Widget> columns = new List<Widget>();
    for (var i = 0; i < 80; i++) {
      columns.add(
        new Container(
          child: new Text("hello column"),
        ),
      );
    }
    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('column'),
      ),
//      body: new Column(
//        children: renderColumn(),
//      ),
      body: new ListView(
        children: renderColumn(),
      ),
    );
  }
}
