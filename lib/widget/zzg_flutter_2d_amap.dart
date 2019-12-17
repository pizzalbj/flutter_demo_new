import 'package:flutter/material.dart';
import 'package:flutter_2d_amap/flutter_2d_amap.dart';

/// 已 set key
class AMapWithMarkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AMapWithMarkPageState();
}

class AMapWithMarkPageState extends State<AMapWithMarkPage> {
  AMap2DController _aMap2DController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AMapWith2DMap"),
      ),
      body: new Container(
        child: AMap2DView(
          onAMap2DViewCreated: (controller) async {
            _aMap2DController = controller;
          },
          onPoiSearched: (result) async {
            await _aMap2DController.move("22.6093900000", "114.0293780000");
          },
        ),
      ),
    );
  }
}
