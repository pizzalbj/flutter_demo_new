import 'package:flutter/material.dart';

class g_PositionFix extends StatefulWidget {
  @override
  g_PositionFixPage createState() => new g_PositionFixPage();
}

class g_PositionFixPage extends State<g_PositionFix> {
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
          // color: const Color(0xffffffff),
          color: Colors.green,
        ),
        child: new Stack(
          children: <Widget>[
            new Positioned(
              // 1.最好每一个 child 都设置 position，不然有不同的效果
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                margin: new EdgeInsets.all(12.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child: new ListView.builder(
                  itemCount: 200,
                  itemBuilder: (context, i) {
                    return new Text("你好 + $i");
                  },
                ),
              ),
            ),

//            // 2.注释1，这里正常。内容还是撑开了。
//            new ListView.builder(
//              itemCount: 200,
//              itemBuilder: (context, i) {
//                return new Text("你好 + $i");
//              },
//            ),

//            // 3.注释1 2，这里怪异。内容没被撑开。
//            new Text("cont"),
            new Positioned(
              right: 30.0,
              bottom: 30.0,
              child: new Container(
                width: 100.0,
                height: 80.0,
                decoration: new BoxDecoration(color: Colors.red),
                child: new Text('hello'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
