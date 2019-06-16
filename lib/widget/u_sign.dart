import 'package:flutter/material.dart';

// 通过继承 CustomPainter 自定义一个控件
class SignaturePainter extends CustomPainter {
  final List<Offset> points;

  SignaturePainter(this.points);

  void paint(Canvas canvas, Size size) {
    // 设置笔的属性
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..strokeJoin = StrokeJoin.bevel;

    for (int i = 0; i < points.length - 1; i++) {
      // points[i]: 起点。points[i + 1]: 终点。
      if (points[i] != null && points[i + 1] != null)
        // 在起点和终点之间画一条线
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  // 是否重绘
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Signature extends StatefulWidget {
  @override
  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> {
  // offset: 一个不可变的 2D 浮点偏移量。
  List<Offset> _points = new List<Offset>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("涂鸦 签名"),
      ),
      body: new Container(
        decoration: new BoxDecoration(
          color: new Color(0xfff6f6f6),
        ),
        child: new Stack(
          children: <Widget>[
            new Positioned(
              top: 0.0,
              bottom: 80.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                height: 460.0,
                margin: new EdgeInsets.all(12.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child: new Column(
                  children: <Widget>[
                    new Expanded(
                      child: new Stack(
                        children: [
                          new GestureDetector(
                            // 按下
                            onPanUpdate: (DragUpdateDetails details) {
                              RenderBox referenceBox =
                                  context.findRenderObject();
                              Offset localPosition = referenceBox
                                  .globalToLocal(details.globalPosition);
                              print(localPosition);
                              setState(() {
                                // todo: 为什么这里不行
                                // _points.add(localPosition);
                                print(_points);
                                _points = new List.from(_points)
                                  ..add(localPosition);
                              });
                            },
                            // 抬起
                            onPanEnd: (DragEndDetails details) {
                              _points.add(null);
                            },
                          ),
                          // CustomPaint: 在绘制阶段提供画布的小部件
                          _points.length > 0
                              ? new CustomPaint(
                                  painter: new SignaturePainter(_points),
                                )
                              : new Center(
                                  child: new Text(("请签名")),
                                )
                        ],
                      ),
                    ),
                    new Container(
                      padding: new EdgeInsets.all(16.0),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                              "请在区域内手写签名",
                              style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          new Container(
                            padding: new EdgeInsets.symmetric(
                              vertical: 0.0,
                              horizontal: 12.0,
                            ),
                            decoration: new BoxDecoration(
                              border: new Border.all(
                                color: const Color(0xffffa500),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: new BorderRadius.all(
                                Radius.circular(18.0),
                              ),
                            ),
                            child: new GestureDetector(
                              onTap: () {
                                print("清空");
                                setState(() {
                                  _points = new List<Offset>();
                                });
                              },
                              child: new Text(
                                "清空",
                                style: new TextStyle(
                                  fontSize: 18.0,
                                  color: const Color(0xffffa500),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Positioned(
              bottom: 10.0,
              left: 20.0,
              right: 20.0,
              child: new Container(
                padding: EdgeInsets.all(20.0),
                // RaisedButton 带阴影。FlatButton 不带阴影
                child: RaisedButton(
                  onPressed: () {
                    // submit();
                  },
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: Text(
                        "保存",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 3.0,
                        ),
                      ),
                    ),
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
