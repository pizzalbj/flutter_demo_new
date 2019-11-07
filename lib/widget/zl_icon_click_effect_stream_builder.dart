import 'dart:async';
import 'package:flutter/material.dart';
import 'likebutton/like_button.dart';

class ItemDemo {
  bool liked;
  String content;

  ItemDemo(this.liked, this.content);
}

class ListTwitterAnimationStreamBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListTwitterAnimationPageState();
}

class _ListTwitterAnimationPageState
    extends State<ListTwitterAnimationStreamBuilderPage> {
  // 原始数据
  List<ItemDemo> _itemDemoList = [
    new ItemDemo(true, "true"),
    new ItemDemo(false, "false"),
    new ItemDemo(true, "true"),
    new ItemDemo(false, "false"),
  ];

  final StreamController<List<ItemDemo>> _streamController =
      new StreamController<List<ItemDemo>>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void doLike(int index, bool like) async {
    print(index);
    print(like);
    await Future.delayed(new Duration(milliseconds: 1000));
    _itemDemoList[index].liked = like;
    _streamController.sink.add(_itemDemoList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("animation in streambuilder"),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<List<ItemDemo>>(
            stream: _streamController.stream,
            initialData: _itemDemoList,
            builder:
                (BuildContext context, AsyncSnapshot<List<ItemDemo>> snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemPage(
                    snapshot.data[index],
                    index,
                    doLike,
                    key: UniqueKey(),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Text("add"),
        onPressed: () {
          _itemDemoList.add(new ItemDemo(false, "false"));
          _streamController.sink.add(_itemDemoList);
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
              // 最好的方法 把组件写成 “叶子"组件，在叶子里面setState改变状态
              setState(() {
                widget.demo.liked = !like;
              });
              // 和 list_setState 一样，callsBack 都会有问题
              // widget.callback(widget.index, !like);
            },
          ),
          new Text(widget.demo.liked.toString()),
        ],
      ),
    );
  }
}
