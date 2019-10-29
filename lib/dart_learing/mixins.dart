/// 在Flutter 中：
//
// 混合的对象是类
// 可以混合多个
///
main() {
  Television television = new Television();
  television.turnOn();

  SmartTelevision smartTelevision = new SmartTelevision();
  smartTelevision.updateApp();
}

class Television {
  void turnOn() {
    _illuminateDisplay();
  }

  void _illuminateDisplay() {
    print("_illuminateDisplay");
  }
}

class Update {
  void updateApp() {
    print("updateApp");
  }
}

class Charge {
  void chargeVip() {
    print("chargeVip");
  }
}

class SmartTelevision extends Television with Update, Charge {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    // 这里可以引入 updateApp 和 chargeVip
    updateApp();
    chargeVip();
  }

  void _bootNetworkInterface() {
    print("_bootNetworkInterface");
  }
}
