import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewLoadingPage extends StatefulWidget {
  WebviewLoadingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WebviewLoadingPage> {
  bool _isLoading = true;

  TextStyle _refreshTextStyle = new TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w300,
    color: Colors.black12,
  );

  WebViewController wvController;

  RefreshController _refreshController = new RefreshController();

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  PanGestureRecognizer _recognizer = PanGestureRecognizer();

  @override
  void initState() {
    // _recognizer.handleEvent(event);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ProgressHUD(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: new SmartRefresher(
            enablePullDown: true,
            header: WaterDropHeader(
              complete: new Text(
                "已更新",
                style: _refreshTextStyle,
              ),
              failed: new Text(
                "加载失败",
                style: _refreshTextStyle,
              ),
              waterDropColor: Colors.red,
            ),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  // body = Text("上拉加载更多", style: _refreshTextStyle);
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("加载失败", style: _refreshTextStyle);
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("松手,加载更多", style: _refreshTextStyle);
                } else if (mode == LoadStatus.noMore) {
                  body = Text("没有更多数据了", style: _refreshTextStyle);
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: _refreshController,
            onRefresh: () {
              wvController.reload();
            },
            child: new Container(
              height: 400.0,
              child: WebView(
                debuggingEnabled: true,
                javascriptMode: JavascriptMode.unrestricted,
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  new Factory<OneSequenceGestureRecognizer>(
                    // () => new EagerGestureRecognizerWidget(),
                    () => _recognizer,
                  ),
                ].toSet(),
                onWebViewCreated: (WebViewController webViewController) {
                  webViewController.loadUrl("https://www.qq.com/");
                  _controller.complete(webViewController);
                  // init wvController to run js
                  wvController = webViewController;
                },
                navigationDelegate: (NavigationRequest request) {
                  print(request.url);
                  return NavigationDecision.navigate;
                },
                onPageFinished: (String s) {
                  setState(() {
                    _isLoading = false;
                  });
                  _refreshController.refreshCompleted();
                },
              ),
            ),
            // child: new GestureDetector(
            //   onVerticalDragStart: (DragStartDetails details) {
            //     print(details);
            //   },
            //   child: new Container(
            //     height: 200.0,
            //     child: WebView(
            //       debuggingEnabled: true,
            //       // gestureRecognizers: new ,
            //       javascriptMode: JavascriptMode.unrestricted,
            //       onWebViewCreated: (WebViewController webViewController) {
            //         webViewController.loadUrl("https://www.qq.com/");
            //         wvController = webViewController;
            //       },
            //       onPageFinished: (String s) {
            //         print(s);
            //         setState(() {
            //           _isLoading = false;
            //         });
            //       },
            //     ),
            //   ),
            // ),
          ),
        ),
        inAsyncCall: _isLoading,
        opacity: 0.0,
      ),
    );
  }
}

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color> valueColor;

  ProgressHUD({
    Key key,
    @required this.child,
    @required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List<Widget>();
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          new Center(
            child: new CircularProgressIndicator(
              valueColor: valueColor,
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}

class EagerGestureRecognizerWidget extends OneSequenceGestureRecognizer {
  EagerGestureRecognizerWidget({PointerDeviceKind kind}) : super(kind: kind);

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
