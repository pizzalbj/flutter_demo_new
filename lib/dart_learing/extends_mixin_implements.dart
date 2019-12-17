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
  smartTelevision.displayShow();
  smartTelevision.updateApp();
  smartTelevision.chargeVip();
  smartTelevision.playCarton();
  smartTelevision.playMovie();
}

/// 电视
class Television {
  void turnOn() {
    print("电视开机");
  }

  void displayShow() {
    print("显示图像");
  }
}

class Carton {
  String cartonName = "carton";

  void playCarton() {
    print("播放卡通片");
  }
}

class Movie {
  void playMovie() {
    print("播放电影");
  }
}

class Update {
  void updateApp() {
    print("更新功能");
  }
}

class Charge {
  void chargeVip() {
    print("充值功能");
  }
}

/// SmartTelevision
/// 子类重写超类的方法，要用 @override
/// 子类调用超类的方法，要用 super
/// Flutter中的继承也有和Java不一样的地方：
/// Flutter中的子类可以访问父类中的所有变量和方法，因为Flutter中没有公有、私有的区别
/// extends Television。继承。override（可写可不写），super（可以）
///   说明：智能电视也是电视，可以开机关机
/// with Update, Charge。混入(Mixins)。override（可写可不写），super（override 的才能super）
///   说明：智能电视才有Update,Charge功能，是新增功能
///   Mixins主要解决的是代码复用问题，作用在于每个具有某项特性的类不用再去具体的实现同样的功能，这是interface接口做不到的功能，上层可以专门负责有什么特性，下层可以只需要关心实现功能即可
///   https://blog.csdn.net/jieqiang3/article/details/90208242
/// implements Carton, Movie。实现了 看电影和看卡通片。override（可写可不写），super（无法）
///   说明：implements: 实现接口。所以无法 super 调用父级方法
class SmartTelevision extends Television
    with Update, Charge
    implements Carton, Movie {
  @override
  String cartonName = "SmartTelevision carton";

  // extends
  @override
  void turnOn() {
    super.turnOn();
  }

  // extends 的 override: 可写可不写。只有 override 才能super
  // @override
  void displayShow() {
    super.displayShow();
  }

  // with
  @override
  void updateApp() {
    super.updateApp();
  }

  // with 的 override: 可写可不写。不override 也能super
  // @override
  void chargeVip() {
    super.chargeVip();
  }

  // implements
  @override
  void playCarton() {
    print("智能电视 播放卡通片");
  }

  // implements 的 override: 可写可不写。无法 super
  void playMovie() {
    print("智能电视 播放电影");
  }
}
