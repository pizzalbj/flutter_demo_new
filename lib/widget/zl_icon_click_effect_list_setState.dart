import 'package:flutter/material.dart';
import 'likebutton/like_button.dart';

class ItemDemo {
  bool liked;
  String content;

  ItemDemo(this.liked, this.content);
}

class ListTwitterAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListTwitterAnimationPageState();
}

class ListTwitterAnimationPageState extends State<ListTwitterAnimationPage> {
  List<ItemDemo> _itemDemoList = new List<ItemDemo>();

  @override
  void initState() {
    super.initState();
    _itemDemoList = [
      new ItemDemo(true, "new"),
      new ItemDemo(false, "new"),
      new ItemDemo(true, "new"),
      new ItemDemo(false, "new"),
    ];
  }

  void doLike(int index, bool like) async {
    await new Future.delayed(new Duration(milliseconds: 1000));
    setState(() {
      _itemDemoList[index].liked = like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("lala"),
      ),
      body: new ListView.builder(
        itemCount: _itemDemoList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < _itemDemoList.length) {
            return ItemPage(
              _itemDemoList[index],
              index,
              doLike,
              key: UniqueKey(),
            );
          } else {
            return Row(
              children: <Widget>[
                new RaisedButton(
                  child: new Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _itemDemoList.add(new ItemDemo(true, "new"));
                    });
                  },
                ),
                new RaisedButton(
                  child: new Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _itemDemoList.removeAt(_itemDemoList.length - 1);
                    });
                  },
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class ItemPage extends StatefulWidget {
  final int index;

  final ItemDemo demo;

  final Function callback;

  ItemPage(this.demo, this.index, this.callback, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Text(widget.index.toString()),
          new LikeButton(
            width: 80.0,
            like: widget.demo.liked,
            onIconClicked: (bool isLike) {
              bool like = widget.demo.liked;
              setState(() {
                widget.demo.liked = !like;
              });
              // widget.callback(widget.index, !like);
            },
          ),
          new Text(widget.demo.liked.toString()),
        ],
      ),
    );
  }
}
