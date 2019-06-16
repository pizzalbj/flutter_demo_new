import 'package:flutter/material.dart';
import 'package:flutter_demo_new/widget/progress_button/reveal_progress_button.dart';

class AnimationButton extends StatefulWidget {
  AnimationButton({Key key, this.title}) : super(key: key);

  final String title;

  @override
  AnimationButtonPage createState() => AnimationButtonPage();
}

class AnimationButtonPage extends State<AnimationButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
          child: RevealProgressButton(),
        ),
      ),
    );
  }
}
