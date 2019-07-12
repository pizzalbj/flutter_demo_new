///
/// Flutter中的继承和Java中的继承是一样的：
//
//  Flutter中的继承是单继承
//  构造函数不能继承
//  子类 重写 超类的方法，要用 @override
//  子类 调用 超类的方法，要用 super
//  Flutter中的继承也有和Java不一样的地方：
//
//  Flutter中的子类可以访问父类中的所有变量和方法，因为Flutter中没有公有、私有的区别
main() {
  Television television = new Television();
  television.turnOn();

  SmartTelevision smartTelevision = new SmartTelevision();
  smartTelevision.turnOn();

  AnotherTelevision anotherTelevision = new AnotherTelevision();
  anotherTelevision.turnOn();
}

class Television {
  void turnOn() {
    _illuminateDisplay();
  }

  void _illuminateDisplay() {
    print("_illuminateDisplay"); // _illuminateDisplay
  }
}

class SmartTelevision extends Television {
  void turnOn() {
    // 这里 super 调用了 超类的方法，所以下面也打印了 _illuminateDisplay
    super.turnOn();
    _bootNetworkInterface();
  }

  void _bootNetworkInterface() {
    print("_bootNetworkInterface"); // _illuminateDisplay _bootNetworkInterface
  }
}

class AnotherTelevision extends Television {
  // 这里无论是否添加 @override 都不会报错
  // 这里无论是否添加 @override 都不会触发 超类Television 的turnOn
  @override
  void turnOn() {
    print("AnotherTelevision");
  }
}
