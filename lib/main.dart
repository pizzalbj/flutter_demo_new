import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_new/navigation.dart';
import 'package:flutter_demo_new/widget/a_gridTest.dart';
import 'package:flutter_demo_new/widget/b_layout.dart';
import 'package:flutter_demo_new/widget/d_dynamicWidget.dart';
import 'package:flutter_demo_new/widget/e_AlertDialogContent.dart';
import 'package:flutter_demo_new/widget/event_bus/colors.dart';
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
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/blocs/application_bloc.dart';
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/blocs/bloc_provider.dart';
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/blocs/main_bloc.dart';
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/ze_pull_to_refresh.dart';
import 'package:flutter_demo_new/widget/s_dynamic_textField.dart';
import 'package:flutter_demo_new/widget/stream_bloc/x_stream_builder.dart';
import 'package:flutter_demo_new/widget/t_only_column.dart';
import 'package:flutter_demo_new/widget/v_keyboard_textField.dart';
import 'package:flutter_demo_new/widget/w_animation.dart';
import 'package:flutter_demo_new/widget/webview_with_tabbar/first_page.dart';
import 'package:flutter_demo_new/widget/widgets/explorer.dart';
import 'package:flutter_demo_new/widget/x_futureBuilder.dart';
import 'package:flutter_demo_new/widget/z_flutter_webview_demo_offcial.dart';
import 'package:flutter_demo_new/widget/za_refresh.dart';
import 'package:flutter_demo_new/widget/zb_image_view.dart';
import 'package:flutter_demo_new/widget/zc_choice_chip.dart';
import 'package:flutter_demo_new/widget/zd_list_dropdownbutton.dart';
import 'package:flutter_demo_new/widget/ze_RaisedButton.dart';
import 'package:flutter_demo_new/widget/zf_custom_router.dart';
import 'package:flutter_demo_new/widget/zg_appBar_status_bar_color.dart';
import 'package:flutter_demo_new/widget/zh_fadeTransition.dart';
import 'package:flutter_demo_new/widget/zi_PopupRouteDemo.dart';
import 'package:flutter_demo_new/widget/event_bus/event.dart';
import 'package:flutter_demo_new/widget/zj_event_bus.dart';
import 'package:flutter_demo_new/widget/zk_children_callback_parent.dart';
import 'package:flutter_demo_new/widget/zl_icon_click_effect.dart';
import 'package:flutter_demo_new/widget/zm_key.dart';
import 'package:flutter_demo_new/widget/zn_listview_key.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MyApp());
void main() => runApp(BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: BlocProvider(
        bloc: MainBloc(),
        child: MyApp(),
      ),
    ));

var img = {
  "url":
      "https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=8b64bcc23aa85edffa8cf925716f6e1e/03087bf40ad162d9c586b78e1fdfa9ec8a13cd3c.jpg",
  "file": "",
  "key": 2,
};

var imgs = [
  {
    "url":
        "http://src.resxz.eqh5.com/qngroup001%2Fu4456511%2F1%2F0%2Fb9e736952c8b46a2bc5bdddf86020a7b.jpg?e=1564471965&token=JkbWPquRXw2qZpNqeM9Tja4rKlZmK0xSIoX-gOki:A9Zi6czfvkYv4c3ueh4QP3XadJY=",
    "key": 1,
  },
  {
    "url":
        "https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=8b64bcc23aa85edffa8cf925716f6e1e/03087bf40ad162d9c586b78e1fdfa9ec8a13cd3c.jpg",
    "file": "",
    "key": 2,
  },
  {
    "url":
        "http://src.resxz.eqh5.com/qngroup001%2Fu4456511%2F1%2F0%2F681d161ae89645eaa06596303a5e5603.jpg?e=1564472069&token=JkbWPquRXw2qZpNqeM9Tja4rKlZmK0xSIoX-gOki:YGOzv5s6YqFVt0M0plvL6lAKaLA=",
    "file": "",
    "key": 3,
  },
  {
    "url":
        "http://src.resxz.eqh5.com/qngroup001%2Fu4456511%2F1%2F0%2F0ade3d7897804e4396f59f564164e0a4.jpg?e=1564472265&token=JkbWPquRXw2qZpNqeM9Tja4rKlZmK0xSIoX-gOki:g-MXDddbg8L3eEYDtCz_suMeuJE=",
    "file": "",
    "key": 4,
  },
];

class MyApp extends StatelessWidget {
  MyApp() {
    Navigation.initPaths();
  }

  @override
  Widget build(BuildContext context) {
    // zg_appBar_status_bar_color.dart
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.red,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    final FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();

    return new RefreshConfiguration(
      headerBuilder: () => WaterDropHeader(),
      // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
      footerBuilder: () => ClassicFooter(),
      // 配置默认底部指示器
      headerTriggerDistance: 80.0,
      // 头部触发刷新的越界距离
      springDescription:
          SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      // 自定义回弹动画,三个属性值意义请查询flutter api
      maxOverScrollExtent: 100,
      //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
      maxUnderScrollExtent: 0,
      // 底部最大可以拖动的范围
      enableScrollWhenRefreshCompleted: true,
      //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
      enableLoadingWhenFailed: true,
      //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
      hideFooterWhenNotFull: false,
      // Viewport不满一屏时,禁用上拉加载更多功能
      enableBallisticLoad: true,
      // 可以通过惯性滑动触发加载更多
      child: new MaterialApp(
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
      ),
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
  Color _primaryColor;
  StreamSubscription _colorSubscription;

  @override
  void dispose() {
    super.dispose();
    //取消订阅
    _colorSubscription.cancel();
  }

  @override
  void initState() {
    super.initState();
    _setThemeColor();
    //订阅eventbus
    _colorSubscription = eventBus.on<ThemeColorEvent>().listen((event) {
      //缓存主题色
      _cacheColor(event.colorStr);
      Color color = AppColors.getColor(event.colorStr);
      setState(() {
        _primaryColor = color;
      });
    });
  }

  _cacheColor(String colorStr) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("themeColorStr", colorStr);
  }

  Future<String> _getCacheColor(String colorKey) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String colorStr = sp.getString(colorKey);
    return colorStr;
  }

  void _setThemeColor() async {
    String cacheColorStr = await _getCacheColor("themeColorStr");
    setState(() {
      _primaryColor = AppColors.getColor(cacheColorStr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        title: Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("flutter listview key"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ListviewKeyPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("flutter key 的使用"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ScreenPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("列表应该仿Twitter点赞动画，setState并保持列表的状态不变"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ListTwitterAnimationPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("children Widget callback Parent Widget"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ChildToParentPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("event_bus"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new EventBusPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("防微信朋友圈 点赞评论 弹窗"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new PopupRoutePageDemo();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("pull_to_refresh"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new PullToRefreshPage();
                }),
              );
            },
          ),
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
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("flutter_widget explorer"),
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setString("token", "pc9527");
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new YayaExplorer(
                    title: "qq",
                    url: "https://www.qq.com",
                  );
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("stream_builder"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new CounterPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("FutureBuilder"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new FutureBuilderPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("flutter_webview_demo_offcial"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new WebViewExample();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("下拉刷新，上拉加载更多"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new RefreshAndLoadMorePage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("图片查看"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ViewDialog(
                    img: img,
                    imgs: imgs,
                    width: MediaQuery.of(context).size.width,
                  );
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("choice_chips"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new MyThreeOptions();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("list_dropdownbutton"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new FormEG();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("RaisedButton width and height"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new RaisedButtonWidthHeightPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("AppBar status bar color"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new CustomStatusBarColor();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("自定义路由 跳转"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new CustomRouter();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("FadeTransition 动画"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new FadeTransitionDemo();
                }),
              );
            },
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
