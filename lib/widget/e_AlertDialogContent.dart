import 'package:flutter/material.dart';

class e_AlertDialogContent extends StatefulWidget {
  @override
  e_AlertDialogContentPage createState() => new e_AlertDialogContentPage();
}

class e_AlertDialogContentPage extends State<e_AlertDialogContent> {

  final TextEditingController _controllerAdvice = new TextEditingController();
  Color bgColor = const Color(0xfff8f8f8);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("e_AlertDialogContent"),
      ),
      body: new IconButton(
        icon: new Icon(Icons.add_comment),
        onPressed: () {
          showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text('添加材料'),
              content: new Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(6.0),
                  ),
                  color: bgColor,
                ),
                child: new SingleChildScrollView(  // 在 AlertDialog 里面使用 Column ListView 会撑高整个屏幕
                  child: new ListBody(
                    children: <Widget>[
                      new TextField(
                        controller: _controllerAdvice,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: const Color(0xff666666),
                        ),
                        decoration: new InputDecoration(
                          border: null,
                          hintText: "请输入名称.",
                          hintStyle: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xffa19e96),
                          ),
                        ),
                      ),
                      new TextField(
                        controller: _controllerAdvice,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: const Color(0xff666666),
                        ),
                        decoration: new InputDecoration(
                          border: null,
                          hintText: "请输入名称.",
                          hintStyle: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xffa19e96),
                          ),
                        ),
                      ),
                      new TextField(
                        controller: _controllerAdvice,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: const Color(0xff666666),
                        ),
                        decoration: new InputDecoration(
                          border: null,
                          hintText: "请输入品牌.",
                          hintStyle: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xffa19e96),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('确定'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
