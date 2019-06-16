import 'package:flutter/material.dart';

// 保养项
class h_nullOrContainer extends StatefulWidget {
  @override
  h_nullOrContainerPage createState() => new h_nullOrContainerPage();
}

class h_nullOrContainerPage extends State<h_nullOrContainer> {
  bool item = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Test"),
      ),
      body: new Container(
        decoration: new BoxDecoration(
          color: const Color(0xffffffff),
        ),
        child: new Column(
          children: <Widget>[
            new Text('top'),
            // item ? new Text("middle"): null, // null in Column will error
            item == true
                ? new Text("middle")
                : new Container(
                    width: 0.0,
                    height: 0.0,
                  ),
            new Text("bottom"),
            new Flexible(
              child: new ListView(
                children: <Widget>[
                  new Text("TOP"),
                  // null,  // error too
                  new Text("Bottom"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
