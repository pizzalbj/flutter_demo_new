import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NovelPage extends StatefulWidget {
  @override
  _NovelPageState createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new WebviewScaffold(
        key: UniqueKey(),
        /// key: PageStorageKey("navel"),
        url: "https://www.taobao.com",
        supportMultipleWindows: true,
        appCacheEnabled: true,
      ),
    );
  }
}
