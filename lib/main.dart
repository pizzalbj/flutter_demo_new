import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_demo_new/navigation.dart';
import 'package:flutter_demo_new/widget/a_gridTest.dart';
import 'package:flutter_demo_new/widget/b_layout.dart';
import 'package:flutter_demo_new/widget/d_dynamicWidget.dart';
import 'package:flutter_demo_new/widget/e_AlertDialogContent.dart';
import 'package:flutter_demo_new/widget/f_dialogSetStatus.dart';
import 'package:flutter_demo_new/widget/g_PositionFix.dart';
import 'package:flutter_demo_new/widget/h_nullOrContainer.dart';
import 'package:flutter_demo_new/widget/i_dialog_demo.dart';
import 'package:flutter_demo_new/widget/j_flutter_list_and_dialog_example.dart';
import 'package:flutter_demo_new/widget/k_tabbar_with_index.dart';
import 'package:flutter_demo_new/widget/l_login_dialog.dart';
import 'package:flutter_demo_new/widget/l_login_dialog_two.dart';
import 'package:flutter_demo_new/widget/n_bottom_sheet.dart';
import 'package:flutter_demo_new/widget/p_custom_scroll_view.dart';
import 'package:flutter_demo_new/widget/q_image_picker.dart';
import 'package:flutter_demo_new/widget/r_listview_in_listview.dart';
import 'package:flutter_demo_new/widget/s_dynamic_textField.dart';
import 'package:flutter_demo_new/widget/t_only_column.dart';

import 'package:flutter_demo_new/widget/v_keyboard_textField.dart';
import 'package:flutter_demo_new/widget/w_animation.dart';

import 'package:flutter_demo_new/widget/webview_flutter/main_page.dart';
import 'package:flutter_demo_new/widget/webview_with_tabbar/first_page.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    Navigation.initPaths();
  }

  @override
  Widget build(BuildContext context) {
    final FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext context) =>
            MyHomePage(title: 'Flutter Demo Home Page'),

        /// 全局 widget webview
        "/widget_webview": (context) => new SafeArea(
              /// usage: Navigator.of(context).pushNamed('/widget', arguments: "https://www.qq.com")
              child: WebviewScaffold(
                // appBar: new AppBar(),
                url: ModalRoute.of(context).settings.arguments,
                withJavascript: true,
                withZoom: true,
                withLocalStorage: true,
                // show a default CircularProgressIndicator
                hidden: true,
                bottomNavigationBar: BottomAppBar(
                  child: new Container(
                    height: 44.0,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: new Row(
                      children: <Widget>[
                        new IconButton(
                          color: Theme.of(context).primaryColor,
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            flutterWebViewPlugin.goBack();
                          },
                        ),
                        new Expanded(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new IconButton(
                                icon: const Icon(Icons.autorenew),
                                onPressed: () {
                                  flutterWebViewPlugin.reload();
                                },
                              ),
                              new IconButton(
                                icon: const Icon(Icons.close),
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  /// Close launched WebView。通过 routes 打开的 webview 不起作用
                                  /// flutterWebViewPlugin.close();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("基本表单"),
            onTap: () {
              /// 自定义导航
              Navigation.navigateTo(
                context,
                'TextFormFieldDemo',
                transition: TransitionType.fadeIn,
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("List 和 Grid"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new a_gridTest();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("上中下布局"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new b_layout();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("动态组件"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new d_dynamicWidget();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("提示框-内容高度不拉伸"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new e_AlertDialogContent();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("提示框更改status"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new f_dialogSetStatus();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("绝对定位"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new g_PositionFix();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("Null和Container(宽高为0)的区别"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new h_nullOrContainer();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("各种类型的弹窗"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new DialogDemo();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("dialog 整个屏幕 并且 轮动单选.dart"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new flutter_list_and_dialog_example();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("TabBar 顶部"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new k_tabbar_with_index();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("登录 1"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new l_login_dialog();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("登录 2"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new TestSignInView();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("bottom_sheet"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new n_bottom_sheet();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("选择照片 image_picker"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new p_image_picker();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("CustomScrollView"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new CustomScrollViewClass();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("Listview in Listview"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ExampleTwo();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("动态输入框 以及 表单验证"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new RepairListQuotePage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("垂直布局 Column(报错) Listview(滚动)"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new TOnlyColumn();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("textField 不被 keyboard 遮挡"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new TestPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("按钮动画"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  // https://github.com/IhorKlimov/FlutterProgressButton
                  return new AnimationButton(title: '按钮动画');
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            // https://www.jb51.net/article/157680.htm
            // 1. IndexedStack 继承自 Stack，可以保存 webview_flutter 的页面状态
            //    但是，应用第一次加载的时候，所有子页状态都被实例化了
            //    最重要的是，webview_flutter 不支持在安卓上面弹出 keyBoard，故不使用
            // 2. IndexedStack 并不能和 flutter_webview_plugin 一齐实现保存页面的 state，
            //    flutter_webview_plugin 适合当文章浏览器，并且在文章浏览器里面添加操作（刷新，后退等），如 home_page 的 goto 按钮
            title: new Text(
                "webview。body 中并没有使用 PageView 或 TabBarView，使用 webview_flutter 和 IndexedStack，实现页面切换保存 state。"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  // return new MainPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            // https://www.jb51.net/article/157680.htm
            // 由上一个 ListTitle 可知，flutter_webview_plugin 和 IndexedStack 是实现不了保存 webview 的 state 的
            // 下面尝试使用 flutter_webview_plugin 和 TabBar + TabBarView + AutomaticKeepAliveClientMixin 实现底部切换 webView，并保存 webview 的 state
            // 1. TabBar + TabBarView + AutomaticKeepAliveClientMixin 也可以实现保存页面的 state，并且具有惰性求值的功能，
            //  这一点比 IndexedStack 和 webview_flutter 的结合好。但是却也无法保存 WebviewScaffold 页面的 state
            // 2. 如果不介意 webview_flutter 调用不了 keyboard 的问题的话，TabBar + TabBarView + AutomaticKeepAliveClientMixin 和 webview_flutter 的结合是最好的
            title: new Text(
                "webview。使用 TabBar + TabBarView + AutomaticKeepAliveClientMixin 来实现顶部导航"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new FirstPage();
                }),
              );
            },
          ),

//          new ListTile(
//            trailing: new Icon(Icons.keyboard_arrow_right),
//            title: new Text("flutter_mvp"),
//            onTap: () {
//              Navigator.of(context).push(
//                new MaterialPageRoute(builder: (ctx) {
//                  return new ContactsPage();
//                }),
//              );
//            },
//          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
