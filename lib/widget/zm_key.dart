import 'package:flutter/material.dart';
import 'dart:math' as math;

// https://blog.csdn.net/weixin_43901866/article/details/88980514

// class StatelessContainer extends StatelessWidget {
//   final Color color =
//       Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
//           .withOpacity(1.0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       color: color,
//     );
//   }
// }

class StatefulContainer extends StatefulWidget {
  StatefulContainer({Key key}) : super(key: key);

  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  final Color color =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class ScreenPage extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<ScreenPage> {
  List<Widget> widgets = [
    // 可以调转widget
    // StatelessContainer(),
    // StatelessContainer(),

    // 不可以调转widget
    // StatefulContainer(),
    // StatefulContainer(),

    // 可以调转widget
    // StatefulContainer(key: UniqueKey()),
    // StatefulContainer(key: UniqueKey()),

    // key的位置的问题，此时widget不是交换位置，而是会重建widget
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: StatefulContainer(key: UniqueKey()),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: StatefulContainer(key: UniqueKey()),
    // ),

    // 可以调转widget
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulContainer(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulContainer(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("key widget Color"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchWidget,
        child: Icon(Icons.undo),
      ),
    );
  }

  switchWidget() {
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}
