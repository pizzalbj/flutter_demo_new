import 'package:flutter/material.dart';
import 'dart:math' as math;

class ListviewKeyPage extends StatefulWidget {
  @override
  ListviewKeyPageState createState() => ListviewKeyPageState();
}

class ListviewKeyPageState extends State<ListviewKeyPage> {
  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("key widget Color"),
      ),
      body: ListView.builder(
        itemCount: widgets.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < widgets.length) {
            return widgets[index];
          } else {
            return Row(
              children: <Widget>[
                new RaisedButton(
                  child: new Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      widgets.add(
                        Padding(
                          // todo: 这里的key有和没有都一样
                          // key: UniqueKey(),
                          padding: const EdgeInsets.all(8.0),
                          child: StatefulContainer(),
                        ),
                      );
                    });
                  },
                ),
                new RaisedButton(
                  child: new Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      widgets.removeAt(widgets.length - 1);
                    });
                  },
                )
              ],
            );
          }
        },
      ),
    );
  }
}

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
