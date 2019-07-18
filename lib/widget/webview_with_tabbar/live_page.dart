import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int number = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.green,
      ),
      child: new Column(
        children: <Widget>[
          new Text("number: $number"),
          new RaisedButton(
            child: new Center(
              child: new Text("add"),
            ),
            onPressed: () {
              setState(() {
                number++;
              });
            },
          ),
        ],
      ),
    );
  }
}
