import 'package:flutter/material.dart';

/// 应该场景如：业务开发中经常会碰到这样的情况，多个 Widget 需要同步同一份全局数据，比如点赞数、评论数、夜间模式等等

// 模型数据
class InheritedTestModel {
  final int count;

  InheritedTestModel(this.count);
}

// 哨所（自定义InheritedWidget类）
class InheritedContext extends InheritedWidget {
  // 以自己的实例作为参数
  final InheritedTestModel inheritedTestModel;
  final Function() increment;
  final Function() reduce;

  // 构造函数
  InheritedContext({
    Key key,
    @required this.inheritedTestModel,
    @required this.increment,
    @required this.reduce,
    @required Widget child,
  }) : super(key: key, child: child);

  // 要从构建上下文获取特定类型的继承小部件的最近实例，可以使用 [BuildContext.inheritFromWidgetOfExactType]
  static InheritedContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedContext);
  }

  // 是否重建取决于Widget组件是否相同
  @override
  bool updateShouldNotify(InheritedContext oldWidget) {
    print(inheritedTestModel != oldWidget.inheritedTestModel);
    return inheritedTestModel != oldWidget.inheritedTestModel;
    // return true;  // 这里无论return true or false 都 一样，why ?
  }
}

// 获取 InheritedContext 的最近实例，然后 increment
class TestWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
        textColor: Colors.black,
        child: new Text('+'),
        onPressed: inheritedContext.increment,
      ),
    );
  }
}

// 获取 InheritedContext 的最近实例，然后 reduce
class TestWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    return new Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10.0),
      child: new RaisedButton(
        textColor: Colors.black,
        child: new Text('-'),
        onPressed: inheritedContext.reduce,
      ),
    );
  }
}

// 获取 InheritedContext 的最近实例，然后显示结果
class TestWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    final inheritedTestModel = inheritedContext.inheritedTestModel;

    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
        textColor: Colors.black,
        child: new Text('${inheritedTestModel.count}'),
        onPressed: () {},
      ),
    );
  }
}

class InheritedWidgetTestContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InheritedWidgetTestContainerState();
  }
}

class InheritedWidgetTestContainerState
    extends State<InheritedWidgetTestContainer> {
  InheritedTestModel _inheritedTestModel;

  @override
  void initState() {
    super.initState();
    _inheritedTestModel = new InheritedTestModel(0);
  }

  _incrementCount() {
    setState(() {
      _inheritedTestModel =
          new InheritedTestModel(_inheritedTestModel.count + 1);
    });
  }

  _reduceCount() {
    setState(() {
      _inheritedTestModel =
          new InheritedTestModel(_inheritedTestModel.count - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    ///
    return new InheritedContext(
      inheritedTestModel: _inheritedTestModel,
      increment: _incrementCount,
      reduce: _reduceCount,
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text('InheritedWidgetTest'),
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new TestWidgetA(),
                new TestWidgetB(),
                new TestWidgetC(),
              ],
            ),
          )),
    );
  }
}
