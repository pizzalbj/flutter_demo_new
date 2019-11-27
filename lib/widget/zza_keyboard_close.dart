import 'dart:math' as math;
import 'package:flutter/material.dart';

/// https://www.jianshu.com/p/038b6d66f369
/// https://www.jianshu.com/p/989d677d0403
/// 问题：某些第三方的输入法有自己的隐藏键盘的按钮，如果使用第三方输入法，那么就会出现问题：
/// 如何在使用第三方的隐藏按钮后，隐藏自定义的toolBar
class LoginPage5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPage5State();
  }
}

class LoginPage5State extends State<LoginPage5> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  // Step1: 响应空白处的焦点的Node
  BlankToolBarModel blankToolBarModel = BlankToolBarModel();

  @override
  void initState() {
    // Step2.1: 焦点变化时的响应
    blankToolBarModel.outSideCallback = focusNodeChange;
    super.initState();
  }

  // Step2.2: 焦点变化时的响应操作
  void focusNodeChange() {
    setState(() {});
  }

  @override
  void dispose() {
    // Step3: 在销毁页面时取消监听
    blankToolBarModel.removeFocusListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      // Step4 用tool创建body
      body: BlankToolBarTool.blankToolBarWidget(context,
          model: blankToolBarModel, body: createBody()),
    );
  }

  Widget createBody() {
    return ListView(
      padding: EdgeInsets.only(left: 20, right: 20),
      children: <Widget>[
        SizedBox(height: 30),
        createInputText(nameController, hint: '请输入用户名', icon: Icons.people),
        SizedBox(height: 30),
        createInputText(pwdController,
            hint: '请输入密码', icon: Icons.power, obscureText: true),
        SizedBox(height: 30),
        createInputText(codeController,
            hint: '请输验证码', icon: Icons.nature, obscureText: true),
        SizedBox(height: 30),
        FlatButton(
          color: Colors.blue,
          child: Text('登录'),
          onPressed: checkLogin,
        )
      ],
    );
  }

  // 创建输入行
  Widget createInputText(TextEditingController controller,
      {obscureText: false, String hint, IconData icon}) {
    // Step5.1 由controller获得FocusNode
    FocusNode focusNode =
        blankToolBarModel.getFocusNodeByController(controller);
    // 输入框
    TextField textField = TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        hintText: hint,
      ),
      obscureText: obscureText,
      // Step5.2 设置FocusNode
      focusNode: focusNode,
    );

    List<Widget> rowList = [];
    // 输入框前的提示图标
    rowList.add(SizedBox(width: 10));
    rowList.add(Icon(icon));
    // 输入框
    rowList.add(Expanded(child: textField));

    return Row(children: rowList);
  }

  // 点击登录处理
  void checkLogin() {
    print(nameController.text);
    print(pwdController.text);
    print(codeController.text);
  }
}

/// 用于持有FocusNode的类
class BlankToolBarModel {
  // 点击空白部分用于响应的FocusNode
  FocusNode blankModel = FocusNode();

  // 保存页面中所有InputText绑定的FocusNode
  Map<String, ToolBarModel> focusNodeMap = {};

  FocusNode _currentEditingNode;

  // 用于外侧的回调
  VoidCallback outSideCallback;

  BlankToolBarModel({this.outSideCallback});

  /**
   * 通过一个key获取node，一般是通过TextEditingController对象的hashCode
   * TextEditingController nickNameController = TextEditingController();
   * String key = nickNameController.hashCode.toString();
   * FocusNode focusNode = blankToolBarModel.getFocusNode(key);
   */
  FocusNode getFocusNode(String key) {
    ToolBarModel barModel = focusNodeMap[key];
    if (barModel == null) {
      barModel =
          ToolBarModel(index: focusNodeMap.length, focusNode: FocusNode());
      barModel.focusNode.addListener(focusNodeListener);
      focusNodeMap[key] = barModel;
    }
    return barModel.focusNode;
  }

  /**
   * 通过controller获取focusNode
   */
  FocusNode getFocusNodeByController(TextEditingController controller) {
    String key = controller.hashCode.toString();
    return getFocusNode(key);
  }

  /**
   * 找到正处于编辑状态的FocusNode
   */
  FocusNode findEditingNode() {
    for (ToolBarModel barModel in focusNodeMap.values) {
      if (barModel.focusNode.hasFocus) {
        return barModel.focusNode;
      }
    }
    return null;
  }

  // 监听FocusNode变化
  Future<Null> focusNodeListener() async {
    FocusNode editingNode = findEditingNode();
    if (_currentEditingNode != editingNode) {
      _currentEditingNode = editingNode;
      print('>>>>>>>>+++++++++++');
      if (outSideCallback != null) {
        outSideCallback();
      }
    } else {
      print('>>>>>>>>----------');
    }
  }

  /// 移除所有监听
  void removeFocusListeners() {
    for (ToolBarModel barModel in focusNodeMap.values) {
      barModel.focusNode.removeListener(focusNodeListener);
    }
  }

  /// 关闭键盘
  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankModel);
  }
}

/**
 * 增加
 * 1、自动处理点击空白页面关闭键盘，
 * 2、键盘上方增加一个toolbar
 */
class BlankToolBarTool {
  static Widget blankToolBarWidget(
      // 上下文
      BuildContext context,
      {
      // 数据model
      BlankToolBarModel model,
      // 要展示的子内容
      Widget body,
      // 是否展示toolBar
      bool showToolBar = true,
      // 默认的toolBar的高度
      double toolBarHeight = 40,
      // toolBar的背景色
      Color toolBarColor = const Color(0xffeeeeee),
      // toolBar的可点击按钮的颜色
      Color toolBarTintColor = Colors.blue}) {
    if (!showToolBar) {
      return GestureDetector(
        onTap: () {
          model.closeKeyboard(context);
        },
        child: body,
      );
    }
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 00,
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              model.closeKeyboard(context);
            },
            child: body,
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: ToolBar(
              height: toolBarHeight,
              color: toolBarColor,
              tintColor: toolBarTintColor,
              focusNodeMap: model.focusNodeMap,
              doneCallback: () {
                // 点击空白处的处理
                model.closeKeyboard(context);
              },
            )),
      ],
    );
  }
}

class ToolBarModel {
  int index;
  FocusNode focusNode;

  ToolBarModel({this.index, this.focusNode});
}

class ToolBar extends StatefulWidget {
  Map<String, ToolBarModel> focusNodeMap;
  VoidCallback doneCallback;
  double height = 40;
  Color color = Color(0xffeeeeee);
  Color tintColor = Colors.blue;

  ToolBar(
      {this.focusNodeMap,
      this.doneCallback,
      this.height = 40,
      this.color = const Color(0xffeeeeee),
      this.tintColor = Colors.blue});

  @override
  State<StatefulWidget> createState() {
    return ToolBarState(
        focusNodeMap: focusNodeMap,
        doneCallback: doneCallback,
        height: height,
        color: color,
        tintColor: tintColor);
  }
}

class ToolBarState extends State<ToolBar> {
  Map<String, ToolBarModel> focusNodeMap;
  VoidCallback doneCallback;
  double height = 40;
  Color color = Color(0xffeeeeee);
  Color tintColor = Colors.blue;

  ToolBarState(
      {this.focusNodeMap,
      this.doneCallback,
      this.height = 40,
      this.color = const Color(0xffeeeeee),
      this.tintColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    ToolBarModel barModel = currentEditingFocusNode();
    if (barModel == null) {
      // 没有任何输入框处于编辑状态，则返回的是0高度的容器
      return Column(
        children: <Widget>[Flexible(child: Container()), Container(height: 0)],
      );
    } else {
      return Column(
        children: <Widget>[
          Flexible(child: Container()),
          createToolBar(barModel)
        ],
      );
    }
  }

  Widget createToolBar(ToolBarModel barModel) {
    // 有输入框在编辑状态
    int currentIndex = barModel.index;
    bool isFirst = currentIndex == 0;
    bool isLast = currentIndex == (focusNodeMap.length - 1);
    // 前一个
    Widget preIcon = Icon(
      Icons.arrow_forward_ios,
      color: isFirst ? Colors.grey : tintColor,
      size: 20.0,
    );
    Widget preBtn = InkWell(
      child: Transform(
          transform: Matrix4.identity()..rotateZ(math.pi), // 旋转的角度
          origin: Offset(10, 10),
          child: preIcon),
      onTap: () {
        focusNodeAtIndex(currentIndex - 1);
      },
    );
    // 下一个
    Widget nextBtn = InkWell(
      child: Icon(
        Icons.arrow_forward_ios,
        color: isLast ? Colors.grey : tintColor,
        size: 20,
      ),
      onTap: () {
        focusNodeAtIndex(currentIndex + 1);
      },
    );

    // 关闭
    // Widget doneBtn = CupertinoButton(
    //   child: Container(height: 40,width: 200,child: Text('关闭')),
    //   onPressed: doneCallback
    // );
    Widget doneBtn = InkWell(
        child: Text(
          '关闭',
          style: TextStyle(color: tintColor),
        ),
        onTap: doneCallback);

    return Container(
      height: height,
      color: color,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          preBtn,
          SizedBox(
            width: 40,
          ),
          nextBtn,
          Flexible(
            child: Container(),
          ),
          doneBtn
        ],
      ),
    );
  }

  // 获取当前获得焦点的对象
  ToolBarModel currentEditingFocusNode() {
    for (ToolBarModel barModel in focusNodeMap.values) {
      if (barModel.focusNode.hasFocus) {
        return barModel;
      }
    }
    return null;
  }

  /// 让指定的某个node获得焦点
  void focusNodeAtIndex(int selectIndex) {
    if (selectIndex < 0 || selectIndex >= focusNodeMap.length) {
      return;
    }
    for (ToolBarModel barModel in focusNodeMap.values) {
      if (selectIndex == barModel.index) {
        barModel.focusNode.requestFocus();
        setState(() {});
        return;
      }
    }
  }
}
