import 'dart:async';

void main() {
  TestTimer testTimer = new TestTimer();
  testTimer.startTimer();
}

class TestTimer {
  int seconds = 60;
  Timer timer;

  void startTimer() {
    // 倒计时
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // 函数内取消
      if (seconds == 0) {
        timer.cancel();
        return;
      }
      seconds--;
      print(seconds);
    });

    new Future.delayed(new Duration(seconds: 5)).then((value) {
      print(value);
      // 函数外取消
      timer.cancel();
    }).catchError((error) {
      print(error);
    });
  }
}
