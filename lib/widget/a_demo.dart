import 'package:flutter/material.dart';

class AnimationButtonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return new Text("lala");
      },
    );
  }
}