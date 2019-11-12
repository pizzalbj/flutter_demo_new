import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewLoadingPage extends StatefulWidget {
  WebviewLoadingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WebviewLoadingPage> {
  bool _isLoading = true;

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
            child: Stack(
              children: <Widget>[
                WebView(
                  initialUrl: "https://www.qq.com/",
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: pageFinishedLoading,
                ),
              ],
            ),
          ),
          inAsyncCall: _isLoading,
          opacity: 0.0,
        ));
  }

  void pageFinishedLoading(String url) {
    setState(() {
      _isLoading = false;
    });
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
