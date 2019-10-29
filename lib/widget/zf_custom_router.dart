import 'package:flutter/material.dart';
import 'package:flutter_demo_new/custom_route.dart';
import 'package:flutter_demo_new/widget/zg_appBar_status_bar_color.dart';

class CustomRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("自定义路由"),
      ),
      body: new Center(
        child: new Container(
          child: new RaisedButton(
            child: new Text("自定义路由 跳转"),
            onPressed: () {
              Navigator.push(
                  context,
                  AnimationRoute(
                    CustomStatusBarColor(),
                    CustomRouteType.rotation,
                  ));
            },
          ),
        ),
      ),
    );
  }
}
