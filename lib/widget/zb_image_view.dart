import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo_new/widget/zzi_enlarge_pic.dart';

/// image 当前点击进入的图片
/// images 格式[{url:'',file:File}]，优先 url
/// width 屏幕宽度
class ViewDialog extends StatefulWidget {
  final image;
  final images;
  final width;

  ViewDialog({Key key, this.image, this.images, this.width}) : super(key: key);

  @override
  _PageStatus createState() => _PageStatus();
}

class _PageStatus extends State<ViewDialog> {
  var image;

  // 屏幕宽
  var w;

  // 当前第几张
  var index = 1;

  // 点击距原点的X轴值
  var down = 0.0;

  // 是否超过了一半
  var half = false;

  var len = 0;

  var _scrollController;

  @override
  void initState() {
    super.initState();
    var n = 0;
    var nn;
    // 获取图片的index：nn
    widget.images.forEach((i) {
      n = n + 1;
      if (i['key'] == widget.image['key']) {
        nn = n;
      }
    });
    // 显示默认的图片
    if (nn > 1) {
      _scrollController =
          ScrollController(initialScrollOffset: widget.width * (nn - 1));
    } else {
      _scrollController = ScrollController(
        initialScrollOffset: 0,
      );
    }
    setState(() {
      len = widget.images.length;
      image = widget.image;
      index = nn;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  nextPage(w) {
    setState(() {
      index = index + 1;
      _scrollController.animateTo(
        (index - 1) * w,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  lastPage(w) {
    setState(() {
      index = index - 1;
      _scrollController.animateTo(
        (index - 1) * w,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  /// 一张一张的滑动
  moveEnd(e, w, l) {
    // 滑动的速度
    var end = e.primaryVelocity;
    if (end > 10 && index > 1) {
      // end > 0：X轴 正方向
      lastPage(w);
    } else if (end < -10 && index < l) {
      // end < 0：X轴 负方向
      nextPage(w);
    } else if (half == true) {
      // 滑动超过一半
      if (down > w / 2 && index < l) {
        // 右边开始滑动超过一半，则下一张
        nextPage(w);
      } else if (down < w / 2 && index > 1) {
        lastPage(w);
      } else {
        print("half == true 颤抖吧");
        _scrollController.animateTo(
          (index - 1) * w,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      }
    } else {
      print("half != true 颤抖吧");
      _scrollController.animateTo(
        (index - 1) * w,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  /// ListView 滑到第一张和最后一张后后，继续滑动并回调
  /// todo: 手指固定不动之后修复不抖动
  imgMove(e, w, l) {
    var left = e.position.dx;
    // 距 原点 的X轴距离
    var now = (index - 1) * w;
    // 手指滑动距离
    var move = left - down;
    // 判断 移动的距离 是否超过 屏幕的一半，用于设置上下一张
    if (left - down > w / 2 || down - left > w / 2) {
      half = true;
    } else {
      half = false;
    }
    if (index != 1 && index != len) {
      _scrollController.jumpTo(now - move);
    } else if (index == 1 && move > 0) {
      // 第一张，向右继续滑动
      _scrollController.jumpTo((now - move) / 2);
    } else if (index == len && move < 0) {
      // 最后一张，向左继续滑动
      _scrollController.jumpTo(now + move.abs() / 2);
    }
  }

  /// 显示图片，w: 图片的宽、l: 图片的数量
  Widget list(w, l) {
    List<Widget> array = [];
    widget.images.forEach((i) {
      array.add(
        /// Listener: 原生的点击事件，比 GestureDetector 更底层
        /// 通过 Listener 来获取 GestureDetector 的信息
        Listener(
          onPointerDown: (e) {
            // 1. 记录点击的位置
            down = e.position.dx;
          },
          onPointerMove: (e) {
            // 2. 监听手指水平滑动
            imgMove(e, w, l);
          },
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            onHorizontalDragEnd: (e) {
              // 3. 手指离开屏幕，设置是上一张还是下一张图片
              moveEnd(e, w, l);
            },
            // todo: 放大功能 应该是这里的手势控制，里面的手势控制会和这里的有冲突
            child: Container(
              width: w,
              child: i['url'] != null && i['url'] != ""
                  ? new EnlargePhonePage(url: i['url'])
                  : Image.file(i['file']),
            ),
          ),
        ),
      );
    });
    return ListView(
      physics: new AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      children: array,
    );
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    var l = widget.images.length;
    return new Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            // 图片
            list(w, l),
            // 下标
            Positioned(
              bottom: 34.0,
              child: Container(
                alignment: Alignment.center,
                width: w,
                child: Text(
                  '$index/$l',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(1, 1)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
