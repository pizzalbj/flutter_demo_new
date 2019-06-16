import 'package:flutter/material.dart';

class d_dynamicWidget extends StatefulWidget {
  @override
  d_dynamicWidgetPage createState() => new d_dynamicWidgetPage();
}

class d_dynamicWidgetPage extends State<d_dynamicWidget> {
  TextEditingController eCtrl = new TextEditingController();
  bool showDialog = false;
  List<String> textList = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("dynamic widget"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add_comment),
            onPressed: () {
              setState(() {
                showDialog = true;
              });
            },
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Text("Hello flutter"),
          showDialog == true
              ? new AlertDialog(
                  title: new Text("Alert Dialog"),
                  content: new TextField(
                    controller: eCtrl,
                    decoration:
                        new InputDecoration.collapsed(hintText: "ADD XYZ"),
                    maxLines: 3,
                    onSubmitted: (String text) {},
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        setState(() {
                          showDialog = false;
                          textList.add(eCtrl.text);
                          eCtrl.clear();
                        });
                      },
                      child: new Text("ok"),
                    )
                  ],
                )
              : new Text(""),
          new Flexible(  //
            child: new ListView.builder(
              itemCount: textList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Row(
                  children: <Widget>[
                    new Checkbox(
                      value: false,
                      onChanged: null,
                    ),
                    new Text(textList[index]),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
