import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFadeIn extends StatefulWidget {
  final Widget child;

  MyFadeIn({@required this.child});

  @override
  State<StatefulWidget> createState() => _MyFadeInState();
}

class _MyFadeInState extends State<MyFadeIn>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    // 1.初始化 动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );

    // 2.初始化 动画
    /// Tween: A linear interpolation between a beginning and ending value. 线性地把 begin 到 end 的值插入
    /// Tween.animate: Tween 线性地输出0-1之间的值来驱动 _controller(AnimationController)，并返回一个新的 Animation 对象赋值给 _animation
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 3.动画开始
    // Starts running this animation forwards (towards the end)
    _controller.forward();

    /// transition: 过度。FadeTransition: Animates the opacity of a widget
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
