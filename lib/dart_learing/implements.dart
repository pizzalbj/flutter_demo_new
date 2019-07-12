///
/// Flutter是没有interface的，但是Flutter中的每个类都是一个隐式的接口，这个接口包含类里的所有成员变量，以及定义的方法。
//
//  如果有一个类 A,你想让类B拥有A的API，但又不想拥有A里的实现，那么你就应该把A当做接口，类B implements 类A.
//
//  所以在Flutter中:
//  class 就是 interface
//  当 class 被当做 interface 用时，class 中的方法就是接口的方法，需要在子类里重新实现，在子类实现的时候要加 @override
//  当 class 被当做 interface 用时，class 中的成员变量也需要在子类里重新实现。在成员变量前加 @override
//  实现接口可以有多个
main() {
  SmartTelevision smartTelevision = new SmartTelevision();
  smartTelevision.turnOn();
  smartTelevision.playCarton();
  smartTelevision.playMovie();
}

class Television {
  void turnOn() {
    _illuminateDisplay();
  }

  void _illuminateDisplay() {
    print("");
  }
}

class Carton {
  String cartonName = "carton";

  void playCarton() {
    print("playCarton In Class Carton");
  }
}

class Movie {
  void playMovie() {
    print("playMovie In Class Movie");
  }
}

class Update {
  void updateApp() {}
}

class Charge {
  void chargeVip() {}
}

class SmartTelevision extends Television
    with Update, Charge
    implements Carton, Movie {
  @override
  String cartonName = "SmartTelevision carton";

  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    updateApp();
    chargeVip();
  }

  void _bootNetworkInterface() {}

  @override
  void playCarton() {
    // TODO: implement playCarton
    print("playCarton in Class SmartTelevision");
  }

  @override
  void playMovie() {
    // TODO: implement playMovie
    print("playMovie in Class SmartTelevision");
  }
}
