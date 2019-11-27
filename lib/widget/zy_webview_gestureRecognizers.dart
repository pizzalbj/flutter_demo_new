import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewGestureRecognizer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WebviewGestureRecognizerState();
}

// gestureRecognizers 配置使用尝试
class WebviewGestureRecognizerState extends State<WebviewGestureRecognizer> {
  /// todo: 说明4：
  /// 修改来查看不同的效果
  /// true: PanGestureRecognizer()，会识别水平和垂直方向的手势，导致 webview 内部网页无法滚动
  ///   SliverAppBar 可以滚动，但是 webview 不可以滚动
  /// false: EagerGestureRecognizer()，会强制控制所有的手势识别，所以 webview 会拥有它自己的手势识别，
  ///   SliverAppBar 可以滚动，并且 webview 也可以滚动。
  ///   重点：但是：webview 和 SliverAppBar 没有联系
  ///   如何上拉时隐藏SliverAppber ?
  ///   如何在webview回到页面顶部后，再下拉显示SliverAppBar ？
  /// 结论：通过 floatingActionButton setState 来修改 webviewRecognizer 的值是无法修改 webview 的手势识别
  bool webviewRecognizer = false;

  ScrollController _controller = new ScrollController();

  WebViewController wvController;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
    });
  }

  hideAppBar() {
    _controller.animateTo(100.0,
        duration: new Duration(milliseconds: 1000), curve: Curves.linear);
  }

  showAppBar() {
    _controller.animateTo(0.0,
        duration: new Duration(milliseconds: 1000), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            title: const Text("webview GuesureRecognizer"),
            floating: true,
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: false,
            child: WebView(
              debuggingEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                new Factory<OneSequenceGestureRecognizer>(
                  // todo: 说明3:
                  // PanGestureRecognizer 会识别水平和垂直方向的手势，导致 webview 内部网页无法滚动
                  // EagerGestureRecognizer 会强制控制所有的手势识别，所以 webview 会拥有它自己的手势识别
                  // CustomGestureWidget 继承于 OneSequenceGestureRecognizer，效果和 EagerGestureRecognizer 一样
                  () => webviewRecognizer
                      ? PanGestureRecognizer()
                      : CustomGestureWidget(),
                  // : EagerGestureRecognizer(),
                ),
              ].toSet(),
              onWebViewCreated: (WebViewController webViewController) {
                webViewController.loadUrl(
                  "https://www.qq.com",
                );
                wvController = webViewController;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Text("change"),
        onPressed: () {
          hideAppBar();
          // todo: 说明2：
          // 通过 setState 修改 gestureRecognizers，对 webview 是不起作用的
          // 即使通过 ValueNotifier 也是不起作用
          setState(() {
            webviewRecognizer = false;
          });
        },
      ),
    );

    // todo: 说明1：
    // 不使用 CustomScrollView（或者是GestureDetector），单独设置 gestureRecognizers，手势是不会起作用的
    // return new WebView(
    //   debuggingEnabled: true,
    //   javascriptMode: JavascriptMode.unrestricted,
    //   gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
    //     new Factory<OneSequenceGestureRecognizer>(
    //       // () => PanGestureRecognizer(),
    //       () => EagerGestureRecognizerWidget(),
    //     ),
    //   ].toSet(),
    //   onWebViewCreated: (WebViewController webViewController) {
    //     webViewController.loadUrl(
    //       "https://www.qq.com",
    //     );
    //   },
    // );
  }
}

class CustomGestureWidget extends OneSequenceGestureRecognizer {
  CustomGestureWidget({PointerDeviceKind kind}) : super(kind: kind);

  @override
  void addAllowedPointer(PointerDownEvent event) {
    print("PointerDownEvent: $event");
    startTrackingPointer(event.pointer, event.transform);
    resolve(GestureDisposition.accepted);
    stopTrackingPointer(event.pointer);
  }

  @override
  String get debugDescription => 'eager';

  @override
  void didStopTrackingLastPointer(int pointer) {
    print("pointer: $pointer");
  }

  @override
  void handleEvent(PointerEvent event) {
    print("event: $event");
  }
}
