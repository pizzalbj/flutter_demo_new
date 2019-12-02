import 'package:flutter/material.dart';

///
/// Route分为了页面路由（PageRoute）和窗口路由（PopupRoute）
///


/// PopupRoute的默认实现均为私有，就是说如果以后要用到的话需要我们自己去实现
class PopRoute extends PopupRoute {
  final Duration _duration = new Duration(milliseconds: 100);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
      )),
      child: child,
    );

    // todo: Flutter (Channel master, v1.10.15-pre.137)
    // 使用包含有“窗口位移“动画的路由（如包含有SlideTransition动画的路由，MaterialPageRoute路由等），
    // 会导致“包含有webview目标的Widget"的滚动条位置异常（位置不是一直都固定在最右方）。
    // 丫丫网站（https://testing.yayayuer.com/home/baby）和百度都会滚动条异常，腾讯（https://www.qq.com）的总是不会，why。
    // return SlideTransition(
    //   position: Tween<Offset>(
    //     begin: Offset(1.0, 0.0),
    //     end: Offset(0.0, 0.0),
    //   ).animate(
    //     CurvedAnimation(
    //       parent: animation,
    //       curve: Curves.fastLinearToSlowEaseIn,
    //       // curve: Curves.fastOutSlowIn,
    //     ),
    //   ),
    //   child: child,
    // );

    // return child;
  }

  @override
  Duration get transitionDuration => _duration;
}


/// PageRoute默认提供了三个公开的实现类
///   CupertinoPageRoute：Cupertino 风格的默认实现
///   MaterialPageRoute：Material 风格的默认实现
///   PageRouteBuilder：自定义 PageRoute，比如一些动画效果
///
/// 如果想自定义页面的切换效果，我们可以使用PageRouteBuilder来自定义路由
///
/// Navigator.push(context, MaterialPageRoute(builder: (context){
///   return test();
/// })); 改为
///
/// Navigator.push(context, animation_route(test()));
enum CustomRouteType {
  fade,
  rotation,
  slide,
}

class AnimationRoute extends PageRouteBuilder {
  final Widget widget;

  final CustomRouteType customRouteType;

  AnimationRoute(this.widget, this.customRouteType)
      : super(
            transitionDuration: const Duration(milliseconds: 300), // 动画时长
            pageBuilder: (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              switch (customRouteType) {
                case CustomRouteType.fade:
                  // 渐变过渡
                  return FadeTransition(
                    opacity:
                        Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation1, //动画样式
                      curve: Curves.fastOutSlowIn, //动画曲线
                    )),
                    child: child,
                  );
                  break;
                case CustomRouteType.rotation:
                  // 翻转缩放
                  return RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation1,
                      curve: Curves.fastOutSlowIn,
                    )),
                    child: ScaleTransition(
                      scale: Tween(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(CurvedAnimation(
                        parent: animation1,
                        curve: Curves.fastOutSlowIn,
                      )),
                      child: child,
                    ),
                  );
                  break;
                case CustomRouteType.slide:
                  // 左右滑动
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                        .animate(
                      CurvedAnimation(
                        parent: animation1,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                    child: child,
                  );
                  break;
                default:
                  // 默认：CustomRouteType.slide
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1.0, 0.0),
                      end: Offset(0.0, 0.0),
                    ).animate(
                      CurvedAnimation(
                          parent: animation1, curve: Curves.fastOutSlowIn),
                    ),
                    child: child,
                  );
              }
            });
}
