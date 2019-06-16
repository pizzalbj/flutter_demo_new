import 'package:flutter/material.dart';

class c_iconAndText_a extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example 3 Page"),
      ),
      body: new Center(
        child: new Row(
          children: <Widget>[
            new Image.asset(
              "images/tips.png",
              width: 36.0,
              height: 36.0,
            ),
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                      "Why doesn't this text wrap? There's plenty of vertical space...aaaaaaaaaaaaaa")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
