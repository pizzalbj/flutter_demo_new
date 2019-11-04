// 参照 https://juejin.im/post/5bf01b7d51882516fa638069
// 不足：listView 列表的时候，setState 动画会 dispose，恢复到最初的状态
// 改进：做成和 Twitter 的一样

import 'package:flutter/material.dart';
import 'package:flutter_demo_new/widget/likebutton/model.dart';
import 'package:flutter_demo_new/widget/likebutton/dot_painter.dart';
import 'package:flutter_demo_new/widget/likebutton/circle_painter.dart';

typedef LikeCallback = void Function(bool isLike);

class LikeButton extends StatefulWidget {
  final bool like;
  final double width;
  final LikeIcon grayIcon;
  final LikeIcon likeIcon;
  final Duration duration;
  final DotColor dotColor;
  final Color circleStartColor;
  final Color circleEndColor;
  final LikeCallback onIconClicked;

  const LikeButton({
    Key key,
    @required this.like,
    @required this.width,
    this.grayIcon = const LikeIcon(
      Icons.favorite_border,
    ),
    this.likeIcon = const LikeIcon(
      Icons.favorite,
    ),
    this.duration = const Duration(milliseconds: 1000),
    this.dotColor = const DotColor(
      dotPrimaryColor: const Color(0xFFFFC107),
      dotSecondaryColor: const Color(0xFFFF9800),
      dotThirdColor: const Color(0xFFFF5722),
      dotLastColor: const Color(0xFFF44336),
    ),
    this.circleStartColor = const Color(0xFFFF5722),
    this.circleEndColor = const Color(0xFFFFC107),
    this.onIconClicked,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> outerCircle;
  Animation<double> innerCircle;
  Animation<double> scale;
  Animation<double> dots;

  // 切换状态
  bool isLiked;

  // 是否点击过
  bool changed = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    isLiked = widget.like;
    _controller =
        new AnimationController(duration: widget.duration, vsync: this)
          ..addListener(() {
            setState(() {});
          });
    _initAllAmimations();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      key: new UniqueKey(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // 散开的花花
          CustomPaint(
            size: Size(widget.width, widget.width),
            painter: DotPainter(
              currentProgress: dots.value,
              color1: widget.dotColor.dotPrimaryColor,
              color2: widget.dotColor.dotSecondaryColor,
              color3: widget.dotColor.dotThirdColorReal,
              color4: widget.dotColor.dotLastColorReal,
            ),
          ),
          // 圆圈
          CustomPaint(
            size: Size(widget.width * 0.2, widget.width * 0.2),
            painter: CirclePainter(
              innerCircleRadiusProgress: innerCircle.value,
              outerCircleRadiusProgress: outerCircle.value,
              startColor: widget.circleStartColor,
              endColor: widget.circleEndColor,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Transform.scale(
              // scale: !isLiked ? 1.0 : scale.value,
              scale: getScale(),
              child: GestureDetector(
                child: Icon(
                  isLiked ? widget.likeIcon.icon : widget.grayIcon.icon,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: widget.width * 0.4,
                ),
                onTap: _onTap,
              ),
            ),
          )
        ],
      ),
    );
    // return ;
  }

  double getScale() {
    if (!isLiked) {
      return 1.0;
    } else {
      if (widget.like && changed == false) {
        return 1.0;
      } else {
        return scale.value;
      }
    }
  }

  void _onTap() {
    if (_controller.isAnimating) return;
    if (changed == false) {
      setState(() {
        changed = true;
      });
    }
    isLiked = !isLiked;
    if (isLiked) {
      _controller.reset();
      _controller.forward();
    } else {
      setState(() {});
    }
    // 回调函数
    if (widget.onIconClicked != null) widget.onIconClicked(isLiked);
  }

  void _initAllAmimations() {
    // 外圆环
    outerCircle = new Tween<double>(
      begin: 0.1,
      end: 1.0,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.0,
          0.3,
          curve: Curves.ease,
        ),
      ),
    );
    // 内圆环
    innerCircle = new Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.2,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );
    // 心形变大
    scale = new Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.35,
          0.7,
          curve: OvershootCurve(),
        ),
      ),
    );
    // 花朵
    dots = new Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.1,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );
  }
}
