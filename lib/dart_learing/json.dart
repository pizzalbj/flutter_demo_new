import 'dart:async';
import 'dart:convert';

void main() {
  /// **** **** json encode decode **** ****
  var jsonA = {
    "reasons": [
      {
        "id": 1,
        "content": "content1",
      },
      {
        "id": 2,
        "content": "content2",
      },
    ]
  };
  String jsonAStr = json.encode(jsonA);
  print(jsonAStr);
  var jsonATwo = json.decode(jsonAStr);
  print(jsonATwo);
  print(jsonATwo["reasons"]);
  print(jsonATwo["reasons"][0]);
  print("");

  /// **** **** model encode decode **** ****
  // json字符串解析成实例对象
  String generatePlatformJson({String key, String value}) {
    JsonModelDemo jsonModelDemo = new JsonModelDemo();
    jsonModelDemo.key = key;
    jsonModelDemo.value = value;
    String jsonStr = jsonEncode(jsonModelDemo);
    return jsonStr;
  }
  String result1 = generatePlatformJson(key: "result1", value: "result1Value");
  print('json 字符串: $result1');

  // 实例对象转化成json字符串
  JsonModelDemo parsePlatformJson(String jsonStr) {
    JsonModelDemo result = JsonModelDemo.fromMap(jsonDecode(jsonStr));
    return result;
  }
  JsonModelDemo modelDemo = parsePlatformJson(result1);
  print('parsePlatformJson: $modelDemo');
  print("");

  /// **** **** 异步等 **** ****
  Future<BaseResp<Album>> getServiceData() async {
    await new Future.delayed(new Duration(milliseconds: 1000));
    return new BaseResp(
      code: "0",
      status: "success",
      msg: "message",
      data: new Album(
        id: "1",
        title: 'title',
        albumId: "1",
        url: "https://www.baidu.com",
      ),
    );
  }

  Future getData() async {
    BaseResp<Album> resp = await getServiceData();
    if (resp.code == "0") {
      try {
        // 为什么这里报错
        Album albumA = Album.formJson(resp.data);
        print("resp:");
        print(resp);
        print(resp.code);
        print("--- ---");
        print(resp.data);
        print(resp.data.id);
        print("--- ---");
      } catch (e) {
        print(e);
      }
    }
  }

  getData();
}

class Album {
  String id;
  String albumId;
  String title;
  String url;

  Album({this.id, this.albumId, this.url, this.title});

  // Album.formJson(Map<String, dynamic> json) 为什么报错
  Album.formJson(json)
      : id = json['id'],
        albumId = json['albumId'],
        title = json['title'],
        url = json['url'];

  /// 和上面的相等的
  Album.fromJsonTwo(Map<String, dynamic> json) {
    id = json['id'];
    albumId = json['albumId'];
    title = json['title'];
    url = json['url'];
  }
}

class BaseResp<T> {
  String code;
  String status;
  String msg;
  T data;

  // BaseResp(this.status, this.code, this.msg, this.data);  // 注意{}，{}代表可选参数
  BaseResp({this.status, this.code, this.msg, this.data});
}

class JsonModelDemo {
  String key;
  String value;

  /// print(model)，就是先转换成字符串再输出
  @override
  String toString() {
    return 'JsonModelDemo{key: $key, value: $value}';
  }

  /// jsonDecode(jsonStr)方法返回的是Map<String, dynamic>类型，需要这里将map转换成实体类
  static JsonModelDemo fromMap(Map<String, dynamic> map) {
    JsonModelDemo jsonModelDemo = new JsonModelDemo();
    jsonModelDemo.key = map['key'];
    jsonModelDemo.value = map['value'];
    return jsonModelDemo;
  }

  /// jsonDecode(jsonStr) 方法中会调用实体类的这个方法。如果实体类中没有这个方法，会报错。
  Map toJson() {
    Map map = new Map();
    map["key"] = this.key;
    map["value"] = this.value;
    return map;
  }
}
