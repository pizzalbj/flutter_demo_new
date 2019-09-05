void main() {
  print("1 initState: ${new DateTime.now()}");
  Test._loadUserInfo();
  print("2 initState: ${new DateTime.now()}");
}

class Test {
  static Future _loadUserInfo() async {
    print("1 _loadUserInfo: ${new DateTime.now()}");
    // await 会阻塞流程，等待紧跟着的的 Future 执行完毕之后，再执行下一条语句
    print(await _getUserInfo());
    print("2 _loadUserInfo: ${new DateTime.now()}");
  }

  static Future _getUserInfo() async {
    await new Future.delayed(new Duration(seconds: 3));
    return "我是用户";
  }
}
