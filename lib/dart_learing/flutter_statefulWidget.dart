import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// LoginPage 继承了 StatefulWidget，就说明 LoginPage is a widget that has mutable state
///
class LoginPage extends StatefulWidget {
  /// State createState()，createState() 是需要返回 State 类的
  /// _LoginPageState 是类型，createState()是要重写的函数，=> _LoginPageState() 就是 return _LoginPageState()
  @override
  _LoginPageState createState() => new _LoginPageState(); // new 可以省略
}

///
/// State: The logic and internal state for a [StatefulWidget]
///
/// abstract class State<T extends StatefulWidget> extends Diagnosticable {
///   T get widget => _widget;  // => _widget 就是 return _widget，返回私有的 _widget
///   T _widget;  // _ 说明是私有的。
///   ...
///
///  BuildContext get context => _element;  // context 就是 StatefulElement which is An [Element] that uses a [StatefulWidget] as its configuration.
///  StatefulElement _element;
///  类 State 接收的参数类型为 StatefulWidget 的。LoginPage 继承于 StatefulWidget，
/// }
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// PS: StatefulWidget 和 State 并没有直接的关系
// StatefulWidget extends Widget, State extends Diagnosticable
// 代码大概：
// 1.声明自己的 Widget LoginPage 是 StatefulWidget
// 2.既然是继承于 StatefulWidget，那么就需要 @override createState()。因为 createState() 接收的是 class State 的 实体，所以声明了 _LoginPageState extends State。
// 3.State 类需要 @override
