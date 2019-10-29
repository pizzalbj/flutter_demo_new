import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomStatusBarColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        brightness: Brightness.dark,
        title: new Text("status Bar color"),
      ),
      body: new Container(),
    );
  }
}
