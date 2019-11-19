import 'package:flutter/material.dart';
import 'package:flutter_demo_new/custom_route.dart';

class PopupRoutePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PopupRoutePageState();
}

class PopupRoutePageState extends State<PopupRoutePage> {
  /// 构建用户头像按钮
  /// 点击头像弹出退出按钮
  Widget _buildUserIcon() {
    return GestureDetector(
      child: Container(
        child: new Icon(Icons.supervised_user_circle),
      ),
      onTap: _showExit,
    );
  }

  /// 构建退出按钮
  Widget _buildExit() {
    return Container(
      width: 91,
      height: 36,
      child: Stack(
        children: <Widget>[
          new Icon(Icons.add),
          Center(
            child: Text(
              "diaomao",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  /// 弹出退出按钮
  /// 点击退出调用 onClick
  void _showExit() {
    Navigator.push(
      context,
      PopRoute(
        child: Popup(
          child: _buildExit(),
          left: 164,
          top: 122,
          onClick: () {
            print("exit");
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("popuproute"),
      ),
      body: new Center(
        child: _buildUserIcon(),
      ),
    );
  }
}

class Popup extends StatelessWidget {
  final Widget child;
  final Function onClick; // 点击child事件
  final double left; // 距离左边位置
  final double top; // 距离上面位置

  Popup({
    @required this.child,
    this.onClick,
    this.left,
    this.top,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
            ),
            Positioned(
              child: GestureDetector(
                  child: child,
                  onTap: () {
                    //点击子child
                    if (onClick != null) {
                      Navigator.of(context).pop();
                      onClick();
                    }
                  }),
              left: left,
              top: top,
            ),
          ],
        ),
        onTap: () {
          //点击空白处
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
