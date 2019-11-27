import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_new/navigation.dart';
import 'package:flutter_demo_new/widget/a_demo.dart';
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
import 'package:flutter_demo_new/widget/zl_icon_click_effect_list_setState.dart';
import 'package:flutter_demo_new/widget/zl_icon_click_effect_stream_builder.dart';
import 'package:flutter_demo_new/widget/zm_key.dart';
import 'package:flutter_demo_new/widget/zn_listview_key.dart';
import 'package:flutter_demo_new/widget/zo_webview_loading.dart';
import 'package:flutter_demo_new/widget/zo_widget_not_rebuild.dart';
import 'package:flutter_demo_new/widget/zp_setstate_widget_rebuild.dart';
import 'package:flutter_demo_new/widget/zq_circle_gesture.dart';
import 'package:flutter_demo_new/widget/zr_complex_page_and_refresh_loadmore.dart';
import 'package:flutter_demo_new/widget/zs_popup_route.dart';
import 'package:flutter_demo_new/widget/zt_customscrollview_appbar.dart';
import 'package:flutter_demo_new/widget/zu_inheritedWidget.dart';
import 'package:flutter_demo_new/widget/zv_globalkey.dart';
import 'package:flutter_demo_new/widget/zw_callback.dart';
import 'package:flutter_demo_new/widget/zx_valueNotifier.dart';
import 'package:flutter_demo_new/widget/zy_webview_gestureRecognizers.dart';
import 'package:flutter_demo_new/widget/zy_webview_gestureRecognizers_two.dart';
import 'package:flutter_demo_new/widget/zz_safeArea.dart';
import 'package:flutter_demo_new/widget/zza_keyboard_close.dart';
import 'package:flutter_demo_new/widget/zzb_image_picker_rotate.dart';
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
    // 订阅eventbus
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

  TextEditingController _textEditingController = new TextEditingController();

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
            title: new Text("Demo"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new DemoPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("image_picker 拍照后，旋转图片"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ImagePickerRotatePage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("点击空白关闭键盘及添加键盘ToolBar"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new LoginPage5();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("SafeArea 学习"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new Scaffold(
                    body: new CustomSafeArea(
                      // top: false,
                      // maintainBottomViewPadding: false,
                      minimum: new EdgeInsets.only(top: 120),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text("lala"),
                          new Text("lala"),
                          new Text("lala"),
                          new TextFormField(
                            controller: _textEditingController,
                          ),
                          new Text("lala"),
                          new Text("lala"),
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("webview gestureRecognizers 尝试 1"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new WebviewGestureRecognizer();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("webview gestureRecognizers 尝试 2"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new WebviewGestureRecognizerTwo();
                }),
              );
            },
          ),

          /// 这边文章，主要说的是，利用Flutter自身的框架来实现，状态管理和消息传递的内容
          /// 通过 InheritedWidget 来保存状态
          /// 通过 context.inheritFromWidgetOfExactType 来获取属性
          /// 使用 ValueNotifer 来实现属性监听
          /// 我们可以对状态管理做一个小结
          /// Key
          ///   保存Widget的状态，我们可以通过给对应Widget的key,来保存状态，并通过Key来拿到状态
          ///   比如是 ObjectKey可以在列表中标记唯一的Key，来保存状态，让动画识别。
          ///   GlobalKey，则可以保存一个状态，其他地方都可以获取。
          /// InheritedWidget
          ///   可以持有一个状态，共它的子树来获取
          ///   这样子树本身可以不直接传入这个字段(这样可以避免多级的Widget时，要一层一层向下传递状态)
          ///   还可以做不同Widget中间的状态同步
          /// ChangeNofier
          ///   继承这里类，我们就可以实现Flutter中的观察者模式，对属性变化做观察
          ///   另外，我们还可以通过第三方库，比如说 Redux和ScopeModel Rx来做这个事情
          ///   但是其基于的原理，应该也是上方的内容。
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("StatefulWidget通信 5：event_bus"),
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
            title: new Text("StatefulWidget通信 4：ValueNotifier"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ValueNotifierCommunication();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("StatefulWidget通信 3：GlobalKey"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new GlobalKeyPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("StatefulWidget通信 2：InheritedWidget"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new InheritedWidgetTestContainer();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("StatefulWidget通信 1：callBack"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new CallBackPage(
                    title: "callBack",
                  );
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("NotificationListener"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ScrollableDemo();
                }),
              );
            },
          ),
          // new ListTile(
          //   trailing: new Icon(Icons.keyboard_arrow_right),
          //   title: new Text("画个圆圈，并在上面有两个Gesture检测"),
          //   onTap: () {
          //     Navigator.of(context).push(
          //       new MaterialPageRoute(builder: (ctx) {
          //         return new CircularSliderPaint(
          //           init: 2,
          //           end: 4,
          //           intervals: 6,
          //           baseColor: Colors.red,
          //           selectionColor: Colors.yellow,
          //           child: new Text("circul"),
          //           onSelectionChange: (data) {
          //             print(data);
          //           },
          //         );
          //       }),
          //     );
          //   },
          // ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("基于 CustomScrollView 实现可浮动交互的 AppBar"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new CustomScrollPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("CustomScrollView 实现复杂页面下拉刷新和加载更多"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new WebviewLoadingPage(
                    title: "Webview Loading",
                  );
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("webview loading progress and webview 下拉刷新"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new WebviewLoadingPage(
                    title: "Webview Loading",
                  );
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("Flutter setState 父组件 兄弟组件 子组件 都会 rebuild"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new SetStateWidgetRebuildPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("Flutter setState 防止 widget rebuild 的终极解决办法"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new WidgetShouldRebuildPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("key 的用法"),
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
            title: new Text("Listview key 的用法"),
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
            title: new Text(
                "仿 Twitter 点赞动画（列表采用 StreamBuilder 构建），setState 并保持列表点赞的状态不变"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new ListTwitterAnimationStreamBuilderPage();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text(
                "仿 Twitter 点赞动画（列表采用 flutter List 构建），setState 并保持列表点赞的状态不变"),
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
            title: new Text("子组件callback父组件"),
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
            title: new Text(
                "微信朋友圈 点赞评论 弹窗。本来打算用PopupRoute做的，但是如何定位窗口的位置还不清楚，故使用了setState"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  // return new PopupRoutePageDemo();
                  return new WeChatLikedPageDemo();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("使用PopupRoute自定义实现PopupWindow功能"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new PopupRoutePage();
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
            title: new Text("StreamBuilder"),
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
