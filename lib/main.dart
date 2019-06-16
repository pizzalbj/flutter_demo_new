import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_demo_new/navigation.dart';
import 'package:flutter_demo_new/widget/o_text_form_field_demo.dart';
import 'package:flutter_demo_new/widget/a_gridTest.dart';
import 'package:flutter_demo_new/widget/b_layout.dart';
import 'package:flutter_demo_new/widget/c_iconAndText.dart';
import 'package:flutter_demo_new/widget/c_iconAndText_a.dart';
import 'package:flutter_demo_new/widget/c_iconAndText_b.dart';
import 'package:flutter_demo_new/widget/c_iconAndText_c.dart';
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
import 'package:flutter_demo_new/widget/m_camera.dart';
import 'package:flutter_demo_new/widget/n_bottom_sheet.dart';
import 'package:flutter_demo_new/widget/p_custom_scroll_view.dart';
import 'package:flutter_demo_new/widget/q_image_picker.dart';
import 'package:flutter_demo_new/widget/r_listview_in_listview.dart';
import 'package:flutter_demo_new/widget/s_dynamic_textField.dart';
import 'package:flutter_demo_new/widget/t_only_column.dart';
import 'package:flutter_demo_new/widget/u_sign.dart';

// import 'package:flutter_demo/widget/u_sign_pad.dart';
import 'package:flutter_demo_new/widget/v_keyboard_textField.dart';
import 'package:flutter_demo_new/widget/w_animation.dart';
// import 'package:flutter_demo_new/widget/mvp/module/contacts/contact_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    Navigation.initPaths();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext context) =>
            MyHomePage(title: 'Flutter Demo Home Page'),
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
            title: new Text("表单"),
            onTap: () {
              // 自定义导航
              Navigation.navigateTo(
                context,
                'TextFormFieldDemo',
                transition: TransitionType.fadeIn,
              );
//              Navigator.of(context).push(
//                new MaterialPageRoute(builder: (ctx) {
//                  return new TextFormFieldDemo();
//                }),
//              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("表格"),
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
            title: new Text("布局"),
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
            title: new Text("icon隔壁有文字。并没有解决问题"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new c_iconAndText();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("有文字 wrap"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new c_iconAndText_a();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("有文字 wrap"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new c_iconAndText_b();
                }),
              );
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.keyboard_arrow_right),
            title: new Text("左icon 右文字 wrap"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  return new c_iconAndText_c();
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
            title: new Text("提示框内容高度不拉伸"),
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
            title: new Text("提示框setStates"),
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
            title: new Text("position fix"),
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
            title: new Text("用 Null or Container(width height zero)"),
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
            title: new Text("dialog_demo"),
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
            title: new Text("TabController"),
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
            title: new Text("login_dialog"),
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
            title: new Text("login_dialog_two"),
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
            title: new Text("camere"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  // return new CameraApp();
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
            title: new Text("image_picker"),
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
//          new ListTile(
//            trailing: new Icon(Icons.keyboard_arrow_right),
//            title: new Text("涂鸦（生成图片，原生）"),
//            onTap: () {
//              Navigator.of(context).push(
//                new MaterialPageRoute(builder: (ctx) {
//                  return new Signature();
//                }),
//              );
//            },
//          ),
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
            title: new Text("progress button"),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (ctx) {
                  // https://github.com/IhorKlimov/FlutterProgressButton
                  return new AnimationButton(title: '按钮动画');
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

//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
