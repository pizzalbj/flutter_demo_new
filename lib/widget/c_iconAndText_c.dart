import 'package:flutter/material.dart';

class c_iconAndText_c extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example 3 Page"),
      ),
      body: new Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        child: new Row(
          children: <Widget>[
            new Image.asset(
              "images/tips.png",
              width: 18.0,
              height: 18.0,
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
              child: new Text(
                "电梯标准维保位置拍照内容模板电梯标准维保位置拍照内容模板电梯标准维保位置拍照内容模板电梯标准维保位置拍照内容模板",
                softWrap: true,
                maxLines: 2,
                style: new TextStyle(
                  fontSize: 14.0,
                  color: const Color(0xfff7723e),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
