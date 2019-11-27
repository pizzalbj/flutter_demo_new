import 'package:flutter/material.dart';

class ValueNotifierCommunication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 2.初始化可被监听的变量 vd，并传入值 "Hello World"
    ValueNotifierData vd = ValueNotifierData('Hello World');

    return Scaffold(
      appBar: AppBar(
        title: Text('Value Notifier Communication'),
      ),
      // 3.传入到 子部件 视图里
      body: _WidgetOne(data: vd),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          // 修改 vd 的值
          vd.value = 'Yes';
        },
      ),
    );
  }
}

// 1.定义
class ValueNotifierData extends ValueNotifier<String> {
  ValueNotifierData(value) : super(value);
}

class _WidgetOne extends StatefulWidget {
  _WidgetOne({this.data});

  final ValueNotifierData data;

  @override
  _WidgetOneState createState() => _WidgetOneState();
}

class _WidgetOneState extends State<_WidgetOne> {
  String info;

  @override
  initState() {
    super.initState();
    // 4.添加监听，_handleValueChanged 可修改里面的值
    widget.data.addListener(_handleValueChanged);
    info = 'Initial mesage: ' + widget.data.value;
  }

  @override
  dispose() {
    widget.data.removeListener(_handleValueChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(info),
    );
  }

  void _handleValueChanged() {
    print("_handleValueChanged");
    setState(() {
      info = 'Message changed to: ' + widget.data.value;
    });
  }
}
