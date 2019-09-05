void main() {
  print("1 initState: ${new DateTime.now()}");
  Test._loadUserInfo();
  print("2 initState: ${new DateTime.now()}");
}

class Test {
  static Future _loadUserInfo() async {
    print("1 _loadUserInfo: ${new DateTime.now()}");
    // 用了 Future.then 这个api，那么就不会等待，直接执行下面的语句，等 Future 执行完了，再调用 then 这个方法。
    _getUserInfo().then((info) {
      print(info);
    });
    print("2 _loadUserInfo: ${new DateTime.now()}");
  }

  static Future _getUserInfo() async {
    await new Future.delayed(new Duration(seconds: 3));
    return "我是用户";
  }
}
