import 'package:flutter/material.dart';
import 'package:flutter_demo_new/widget/w_animation.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  FutureBuilderPageState createState() => FutureBuilderPageState();
}

class FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<String> getFuture() async {
    await new Future.delayed(new Duration(milliseconds: 3000)).then((_) {
      print("3秒过了");
    });
    return "I am Future";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      body: new FutureBuilder(
        future: getFuture(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              // Without return widget here, it will call ConnectionState.done twice and context and snapshot is null
              return new Center(
                child: new Text("loading..."),
              );
            case ConnectionState.done:
              return new Center(
                child: new Text(
                  "finish...",
                  style: new TextStyle(color: Colors.red),
                ),
              );
          }
          return null;
        },
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Text("goto"),
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(builder: (ctx) {
              return new AnimationButton(
                title: "我来了",
              );
            }),
          );
        },
      ),
    );
  }
}
