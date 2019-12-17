import 'package:amap_location/amap_location.dart';
import 'package:flutter/material.dart';

class MapTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MapTestPageState();
}

class MapTestPageState extends State<MapTestPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> getLocation() async {
    print("get location 注意定位权限 仅iOS，Android还需要申请key和配置");
    await AMapLocationClient.setApiKey("ef7b50adb1686e99d94c42e1ae97419b");
    print("have set key");
    await AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    var location = await AMapLocationClient.getLocation(true);
    print(location.city);
    print("经：${location.longitude}");
    print("纬：${location.latitude}");
    print(location.number);
    print(location.accuracy);
    print(location.adcode);
    print(location.AOIName);
    print(location.citycode);
    print(location.country);
    print(location.description);
    print(location.district);
    print(location.formattedAddress);
    // 监听定位
    // AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
    //   if (!mounted) return;
    //   setState(() {});
    // });
    // AMapLocationClient.startLocation();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("高德地图"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("高德地图获取位置"),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Text("位置"),
        onPressed: () async {
          await getLocation();
        },
      ),
    );
  }
}
