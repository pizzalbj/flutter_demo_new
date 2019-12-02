import 'package:flutter/material.dart';

class WidgetCyclePage extends StatefulWidget {
  final String title;

  WidgetCyclePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetCyclePagetate();
}

class _WidgetCyclePagetate extends State<WidgetCyclePage> {
  @override
  void initState() {
    super.initState();
    print("initState");
  }

  /// 这个函数会紧跟在initState之后调用，并且可以调用BuildContext.inheritFromWidgetOfExactType
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  /// 当组件的状态改变的时候就会调用didUpdateWidget,比如调用了setState
  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  /// 在dispose之前，会调用这个函数
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    print("Widget build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
