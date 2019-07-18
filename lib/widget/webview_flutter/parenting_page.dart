import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ParentingPage extends StatefulWidget {
  @override
  _ParentingPageState createState() => _ParentingPageState();
}

class _ParentingPageState extends State<ParentingPage> {
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
      /// flutter_webview_plugin
//      body: new WebviewScaffold(
//        /// key: UniqueKey(),
//        /// key: PageStorageKey("learning"),
//        url: "https://www.qq.com",
//        supportMultipleWindows: true,
//        appCacheEnabled: true,
//      ),

      /// webview_flutter
      body: Builder(builder: (BuildContext context) {
        return WebView(
          /// 这里无论是否使用 key，页面 state 都能保存下来
          /// key: PageStorageKey("learning"),
          /// key: UniqueKey(),
          initialUrl: "https://www.jd.com",
          javascriptMode: JavascriptMode.unrestricted,
        );
      }),
    );
  }
}
