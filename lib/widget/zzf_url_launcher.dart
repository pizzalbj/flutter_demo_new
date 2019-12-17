import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

/// https://blog.csdn.net/jdazy/article/details/79208754
/// QQ： mqq:// 
/// 微信： weixin:// 
/// 京东： openapp.jdmoble:// 
/// 淘宝： taobao:// 
/// 美团： imeituan:// 
/// 点评： dianping:// 
/// 1号店： wccbyihaodian:// 
/// 支付宝： alipay:// 
/// 微博： sinaweibo:// 
/// 腾讯微博： TencentWeibo:// 
/// weico微博： weico:// 
/// 知乎： zhihu:// 
/// 豆瓣fm： doubanradio:// 
/// 网易公开课： ntesopen:// 
/// Chrome： googlechrome:// 
/// QQ浏览器： mqqbrowser:// 
/// uc浏览器： ucbrowser:// 
/// 搜狗浏览器： SogouMSE:// 
/// 百度地图： baidumap:// bdmap:// 
/// 优酷： youku:// 
/// 人人： renren:// 
/// 我查查： wcc:// 
/// 有道词典： yddictproapp:// 
/// 微盘： sinavdisk:// 
/// 名片全能王： camcard://
///
///

class UrlLauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("url_launcher"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: Text('Url_launcher：打开 链接'),
              onPressed: () {
                launch("https://www.qq.com");
              },
            ),
            new RaisedButton(
              child: Text('Url_launcher：打开 youtube'),
              onPressed: () {
                launch('vnd.youtube://');
              },
            ),
            new RaisedButton(
              child: Text('Url_launcher：打开 淘宝'),
              onPressed: () {
                launch("taobao://");
              },
            ),
            new RaisedButton(
              child: Text('Url_launcher：打开 百度地图 进行导航'),
              onPressed: () async {
                bool la = await launch(
                    "baidumap://map/direction?&destination=23.1710200000,113.3424690000&coord_type=gcj02&mode=driving&src=ios.yayayuer.app");
                print("launch: $la");
              },
            ),
            new RaisedButton(
              child: Text('Url_launcher：打开 高德地图 进行导航'),
              onPressed: () {
                const url = "iosamap://navi?sourceApplication=applicationName&backScheme=applicationScheme&poiname=fangheng&poiid=BGVIS&lat=36.547901&lon=104.258354&dev=1&style=2";
                launch(url);
              },
            ),
            new RaisedButton(
              child: Text('Url_launcher：打开 苹果地图 经纬查询（会先打开游览器，如何直接打开）'),
              onPressed: () {
                launch("https://maps.apple.com/");
              },
            ),
            new RaisedButton(
              child: Text('Url_launcher：canLaunch 测试'),
              onPressed: () => _canLaunch(),
            ),
            new RaisedButton(
              child: Text('MapLauncher：打开 苹果地图 经纬查询（会先打开游览器）'),
              onPressed: () => _launchAppleMapLngLat(),
            ),
            new RaisedButton(
              child: Text('MapLauncher：打开 苹果地图 地址地址（会先打开游览器）'),
              onPressed: () => _launchAppleMapQuery(),
            ),
          ],
        ),
      ),
    );
  }

  _launchUrl() {
    const url = 'https://www.qq.com';
    launch(url);
  }

  _launchYoutube() async {
    const url = 'vnd.youtube://';
    launch('vnd.youtube://');
  }

  _launchTaobao() async {
    const url = 'taobao://item.taobao.com';
    launch(url);
  }

  _launchAppleMapLngLat() {
    MapsLauncher.launchCoordinates(23.1267200000, 113.3265600000);
  }

  _launchAppleMapQuery() {
    const String query = "广州市天河区富力盈隆广场";
    MapsLauncher.launchQuery(query);
  }

  _launchAppleMapLngLatUrlLauncher() {
    const url = "https://maps.apple.com/?q=null&ll=23.1267200000,113.3265600000";
    launch(url);
  }

  _launchBaiduMap() {
    const url1 = "baidumap://map";
    launch(url1);
  }

  _launchAMap() {

  }

  _canLaunch() async {
    // true
    // String _url = "http://www.qq.com";

    // false，但是我可以打开高德地图，所以说 canLaunch 只适合 http 的 url，并不全部适合 uri
    String _url = "iosamap://navi?sourceApplication=applicationName&backScheme=applicationScheme&poiname=fangheng&poiid=BGVIS&lat=36.547901&lon=104.258354&dev=1&style=2";

    bool canL = await canLaunch(_url);
    print(canL);
    if (canL) {
      launch(_url);
    } else {
      print('Could not launch $_url');
    }
  }
}
