import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_new/navigation.dart';
import 'package:flutter_demo_new/widget/progress_button/reveal_progress_button_painter.dart';
import 'package:flutter_demo_new/widget/progress_button/progress_button.dart';

import 'package:flutter_demo_new/widget/progress_button/page_two.dart';


class RevealProgressButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RevealProgressButtonState();
}

class _RevealProgressButtonState extends State<RevealProgressButton> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  double _fraction = 0.0;

  @override
  Widget build(BuildContext context) {
    // CustomPaint: 在绘制阶段提供画布的小部件
    return CustomPaint(
      // When asked to paint, CustomPaint first asks its painter to paint on the current canvas,
      // then it paints its child, and then, after painting its child, it asks its foregroundPainter to paint.
      painter: RevealProgressButtonPainter(_fraction, MediaQuery.of(context).size),
      child: ProgressButton(reveal),  //
      // foregroundPainter: ,
    );
  }

  @override
  void deactivate() {
    reset();
    super.deactivate();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  void reveal() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
        if (state == AnimationStatus.completed) {

//          Navigator.of(context).push(
//            new MaterialPageRoute(builder: (ctx) {
//              return new PageTwo(title: 'Second Page');
//            }),
//          );

          Navigation.navigateTo(
            context,
            'page_two',
            transition: TransitionType.fadeIn,
          );
        }
      });
    _controller.forward();
  }

  void reset() {
    _fraction = 0.0;
  }
}
