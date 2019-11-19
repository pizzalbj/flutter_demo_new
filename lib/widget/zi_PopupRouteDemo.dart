import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Post {
  final String content;

  bool showDialog;

  Post(this.content, this.showDialog);
}

class WeChatLikedPageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WeChatLikedPageDemoState();
}

class WeChatLikedPageDemoState extends State<WeChatLikedPageDemo> {
  List<Post> _list = [
    new Post("0", false),
    new Post("1", false),
    new Post("2", false),
    new Post("3", false),
    new Post("4", false),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("pop"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new ListView.builder(
                itemCount: _list.length + 1,
                shrinkWrap: true, // 没有这个东西，会报错
                itemBuilder: (BuildContext context, int index) {
                  if (index < _list.length) {
                    return new Column(
                      children: <Widget>[
                        new Container(
                          height: 88.0,
                          color: Colors.yellow,
                          child: new Center(
                            child: new Text(_list[index].content),
                          ),
                        ),
                        new Container(
                          key: new ValueKey(index),
                          color: Colors.red,
                          child: new Row(
                            children: <Widget>[
                              new Spacer(flex: 1),
                              _list[index].showDialog
                                  ? new Text("here")
                                  : new Container(),
                              new IconButton(
                                icon: new Icon(Icons.more_horiz),
                                onPressed: () {
                                  for (var i = 0, len = _list.length;
                                      i < len;
                                      i++) {
                                    if (i == index) {
                                      setState(() {
                                        _list[i].showDialog = !_list[i].showDialog;
                                      });
                                    } else {
                                      setState(() {
                                        _list[i].showDialog = false;
                                      });
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return new RaisedButton(
                      child: new Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _list.addAll([
                            new Post("0", false),
                            new Post("1", false),
                            new Post("2", false),
                            new Post("3", false),
                            new Post("4", false),
                          ]);
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
