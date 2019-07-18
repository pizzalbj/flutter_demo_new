import 'package:flutter/material.dart';

class CustomScrollViewClass extends StatefulWidget {
  @override
  CustomScrollViewClassState createState() => new CustomScrollViewClassState();
}

class CustomScrollViewClassState extends State<CustomScrollViewClass> {
  Color bgColor = const Color(0xfff8f8f8);

  Widget renderTips() {
    return new Container(
      decoration: new BoxDecoration(
        color: bgColor,
      ),
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
        child: new Row(
          children: <Widget>[
            new Image.asset(
              "static/images/close_page.png",
              width: 18.0,
              height: 18.0,
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
              child: new Text(
                "电梯标准维保位置拍照内容模板",
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('CustomScrollView'),
      ),
      body: new Column(
        children: <Widget>[
          new SliverPadding(
            padding: new EdgeInsets.all(12.0),
            sliver: new SliverToBoxAdapter(
              child: renderTips(),
            ),
          ),
          new Flexible(
            child: new CustomScrollView(
              slivers: <Widget>[
                // renderTips(),
                // new Text("Hello"),
                new SliverPadding(
                  // 别考虑一个一个地放下去，how to user sliverList
                  padding: new EdgeInsets.all(12.0),
                  sliver: const SliverToBoxAdapter(
                    child: const SizedBox(
                      width: 400.0,
                      height: 400.0,
                      child: const Text('padded'),
                    ),
                  ),
                ),
                new SliverGrid(
                  gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.0,
                  ),
                  delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return new Container(
                        alignment: Alignment.center,
                        color: Colors.teal[100 * (index % 9)],
                        child: new Text('grid item $index'),
                      );
                    },
                    childCount: 20,
                  ),
                ),
                new SliverFixedExtentList(
                  // 可设置固定高度。
                  itemExtent: 50.0,
                  delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return new Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: new Text('list item $index'),
                      );
                    },
                    childCount: 200, // 若不定义，将无限下滚~
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
