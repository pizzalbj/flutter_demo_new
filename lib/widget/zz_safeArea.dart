import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

/// copy the SafeArea to learn how it works
class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({
    Key key,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
    @required this.child,
  })  : assert(left != null),
        assert(top != null),
        assert(right != null),
        assert(bottom != null),
        super(key: key);

  final bool left;

  final bool top;

  final bool right;

  final bool bottom;

  // 提供的 EdgeInsets
  final EdgeInsets minimum;

  // 未能理解有何用
  final bool maintainBottomViewPadding;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final MediaQueryData data = MediaQuery.of(context);
    print(data);

    /// data:
    /// size: Size(375.0, 812.0)  (1125, 2436)/devicePixelRatio
    /// devicePixelRatio: 3.0,
    /// textScaleFactor: 1.0,
    /// platformBrightness: Brightness.dark,
    /// padding: EdgeInsets(0.0, 44.0, 0.0, 34.0),  // left top right bottom
    /// viewPadding: EdgeInsets(0.0, 44.0, 0.0, 34.0),  // left top right bottom
    /// viewInsets: EdgeInsets.zero,  // 应用程序可以呈现到的显示矩形每边的物理像素数
    /// physicalDepth: 1.7976931348623157e+308,
    /// alwaysUse24HourFormat: true,
    /// accessibleNavigation: false,
    /// highContrast: false,
    /// disableAnimations: false,
    /// invertColors: false,
    /// boldText: false
    EdgeInsets padding = data.padding;
    print(data.padding.bottom); // 0
    print(data.viewInsets.bottom); // 0
    print(maintainBottomViewPadding); // false
    if (data.padding.bottom == 0.0 &&
        data.viewInsets.bottom != 0.0 &&
        maintainBottomViewPadding) {
      padding = padding.copyWith(bottom: data.viewPadding.bottom);
      print(padding);
    }

    return Padding(
      padding: EdgeInsets.only(
        left: math.max(left ? padding.left : 0.0, minimum.left),
        top: math.max(top ? padding.top : 0.0, minimum.top),
        right: math.max(right ? padding.right : 0.0, minimum.right),
        bottom: math.max(bottom ? padding.bottom : 0.0, minimum.bottom),
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: left,
        removeTop: top,
        removeRight: right,
        removeBottom: bottom,
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(FlagProperty('left', value: left, ifTrue: 'avoid left padding'));
    properties
        .add(FlagProperty('top', value: left, ifTrue: 'avoid top padding'));
    properties
        .add(FlagProperty('right', value: left, ifTrue: 'avoid right padding'));
    properties.add(
        FlagProperty('bottom', value: left, ifTrue: 'avoid bottom padding'));
  }
}

class SliverSafeArea extends StatelessWidget {
  const SliverSafeArea({
    Key key,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    @required this.sliver,
  })  : assert(left != null),
        assert(top != null),
        assert(right != null),
        assert(bottom != null),
        super(key: key);

  final bool left;

  final bool top;

  final bool right;

  final bool bottom;

  final EdgeInsets minimum;

  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return SliverPadding(
      padding: EdgeInsets.only(
        left: math.max(left ? padding.left : 0.0, minimum.left),
        top: math.max(top ? padding.top : 0.0, minimum.top),
        right: math.max(right ? padding.right : 0.0, minimum.right),
        bottom: math.max(bottom ? padding.bottom : 0.0, minimum.bottom),
      ),
      sliver: MediaQuery.removePadding(
        context: context,
        removeLeft: left,
        removeTop: top,
        removeRight: right,
        removeBottom: bottom,
        child: sliver,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(FlagProperty('left', value: left, ifTrue: 'avoid left padding'));
    properties
        .add(FlagProperty('top', value: left, ifTrue: 'avoid top padding'));
    properties
        .add(FlagProperty('right', value: left, ifTrue: 'avoid right padding'));
    properties.add(
        FlagProperty('bottom', value: left, ifTrue: 'avoid bottom padding'));
  }
}
