import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_new/widget/zo_webview_loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewGestureRecognizerTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DemoPageState();
}

class DemoPageState extends State<WebviewGestureRecognizerTwo> {
  bool webviewGestureRecognizer = true;

  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();

    /// 其实和 webview gestureRecognizers 尝试 1 差不多
    /// 只不过是 修改 webviewGestureRecognizer 的值换成了 _controller 的滚动距离
    _controller.addListener(() {
      print(_controller.offset > 50);
      if (_controller.offset > 50) {
        setState(() {
          webviewGestureRecognizer = false;
        });
      } else {
        setState(() {
          webviewGestureRecognizer = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          title: const Text("Heading"),
          floating: true,
        ),
        SliverFillRemaining(
          hasScrollBody: true,
          fillOverscroll: false,
          child: new WebView(
            debuggingEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
              new Factory<OneSequenceGestureRecognizer>(
                () => webviewGestureRecognizer
                    ? PanGestureRecognizer()
                    : EagerGestureRecognizerWidget(),
              ),
            ].toSet(),
            onWebViewCreated: (WebViewController webViewController) {
              webViewController.loadUrl(
                "https://www.qq.com",
              );
            },
          ),
        ),
      ],
    );
  }
}
