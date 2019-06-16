import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_new/widget/progress_button/page_two.dart';
import 'package:flutter_demo_new/widget/progress_button/home_page.dart';

import 'package:flutter_demo_new/widget/o_text_form_field_demo.dart';

class Navigation {
  static Router router;

  static void initPaths() {
    // 可用可不用
    router = Router()
      ..define(
        'TextFormFieldDemo',
        handler: Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params) {
            return TextFormFieldDemo();
          },
        ),
      )
      ..define(
        'page_two',
        handler: Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params) {
            return PageTwo(title: 'Second Page');
          },
        ),
      );
  }

  static void navigateTo(
      BuildContext context,
      String path, {
        bool replace = false,
        TransitionType transition = TransitionType.native,
        Duration transitionDuration = const Duration(milliseconds: 250),
        RouteTransitionsBuilder transitionBuilder,
      }) {
    router.navigateTo(
      context,
      path,
      replace: replace,
      transition: transition,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
    );
  }
}
