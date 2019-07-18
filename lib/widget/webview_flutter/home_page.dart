import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String selectedUrl = "https://www.qq.com";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKeyHome = GlobalKey<ScaffoldState>();
  int number = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKeyHome,
        body: new Column(
          children: <Widget>[
            new Container(
              child: new Text('number: $number'),
            ),
            new RaisedButton(
              child: new Text("+"),
              onPressed: () {
                setState(() {
                  number++;
                });
              },
            ),
            new RaisedButton(
              child: new Text("qq.com"),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/widget_webview', arguments: selectedUrl);
                // flutterWebViewPlugin.launch(selectedUrl);
              },
            ),
          ],
        ));
  }
}
