import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YayaExplorer extends StatefulWidget {
  final String url;

  final String title;

  YayaExplorer({Key key, this.title, this.url}) : super(key: key);

  @override
  _YayaExplorerState createState() => _YayaExplorerState();
}

class _YayaExplorerState extends State<YayaExplorer> {
  String url = '';

  String title = '';

  String auth_token = '';

  Map<String, String> auth_header;

  WebViewController _controller;

  @override
  void initState() {
    super.initState();
    url = widget.url;
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(title),
      ),
      body: new WebView(
        // todo: 卧槽，这里注释了，就没用调用两次了
        // initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          webViewController.loadUrl(
            url,
            headers: auth_header,
          );
          _controller = webViewController;
        },
        onPageFinished: (String s) {
          // todo: 为何这里调用了两次
          print("--- onPageFinished ---");
          print(s);
          print("--- onPageFinished ---");
        },
      ),
    );
  }
}
