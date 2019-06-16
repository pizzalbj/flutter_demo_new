import 'package:flutter/material.dart';

class c_iconAndText_b extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example 3 Page"),
      ),
      body: new Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        child: new Text(
          "如果保养过程中发现需要维修/更换材料，请填写维修建议和更换材料等信息。",
          softWrap: true,
          maxLines: 2,
          style: new TextStyle(
            fontSize: 14.0,
            color: const Color(0xfff7723e),
          ),
        ),
      ),
    );
  }
}
