import 'package:flutter/material.dart';

class b_layout extends StatelessWidget {
  static const String routeName = '/material/modal-bottom-sheet';

  @override
  Widget build(BuildContext context) {
    _toExample2(context){
      print("To Example 2");
    }

    _toExample3(context){
      print("To Example 3");
    }

    List<Widget> menu = <Widget>[
      new IconButton(
        icon: new Icon(Icons.send),
        tooltip: 'To Example 2',
        onPressed: () => _toExample2(context),
      ),
      new IconButton(
        icon: new Icon(Icons.help),
        tooltip: 'To Example 3',
        onPressed: () => _toExample3(context),
      )
    ];


    Widget subtitle = new Container (
      padding: new EdgeInsets.all(8.0),
      color: new Color(0X33000000),
      child: new Text('Subtitle'),
    );

    Widget middleSection = new Expanded(
      child: new Container (
        padding: new EdgeInsets.all(8.0),
        color: new Color(0X9900CC00),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Text('Some data here'),
            new Text('More stuff here'),
          ],
        ),
      ),
    );

    Widget bottomBanner = new Container (
      padding: new EdgeInsets.all(8.0),
      color: new Color(0X99CC0000),
      height: 48.0,
      child: new Center(
        child: new Text('Bottom Banner'),
      ),
    );

    Widget body = new Column(
      // This makes each child fill the full width of the screen
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        subtitle,
        middleSection,
        bottomBanner,
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example 1 Page"),
        actions: menu,
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: body,
      ),
    );
  }
}