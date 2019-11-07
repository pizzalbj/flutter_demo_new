// https://segmentfault.com/a/1190000020264112

library should_rebuild_widget;

import 'package:flutter/material.dart';

typedef ShouldRebuildFunction<T> = bool Function(T oldWidget, T newWidget);

// 1. T extends Widget: <>说明数据类型用的，这里 T 是自定义类型（也可以是其他字幕），扩展了 Widget，
// 所以传进来的参数必须是 extends Widget 的，主要包括 StateFulWidget or StateLessWidget
class ShouldRebuild<t extends Widget> extends StatefulWidget {

  final t child;

  final ShouldRebuildFunction<t> shouldRebuild;

  ShouldRebuild({@required this.child, @required this.shouldRebuild})
      : assert(() {
          if (child == null) {
            throw FlutterError.fromParts(<DiagnosticsNode>[
              ErrorSummary('ShouldRebuild widget: child must not be  null')
            ]);
          } else if (shouldRebuild == null) {
            throw FlutterError.fromParts(<DiagnosticsNode>[
              ErrorSummary(
                  'ShouldRebuild widget: shouldRebuild must not be  null')
            ]);
          }
          return true;
        }());

  @override
  _ShouldRebuildState createState() => _ShouldRebuildState<t>();
}

class _ShouldRebuildState<T extends Widget> extends State<ShouldRebuild> {
  T oldWidget;

  @override
  ShouldRebuild<T> get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    print(widget.child);
    print(widget.shouldRebuild);
    print(oldWidget);
    final T newWidget = widget.child;
    if (this.oldWidget == null || (widget.shouldRebuild == null ? true : widget.shouldRebuild(oldWidget, newWidget))) {
      // 返回 新widget
      this.oldWidget = newWidget;
    }
    return oldWidget;
  }
}
