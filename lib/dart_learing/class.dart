///
/// https://blog.csdn.net/hekaiyou/article/details/51525156
import "dart:math";

void main() {
  var point = new Point.fromJson({'x': 2, 'y': 4});

  var emp = new Employee.fromJson({});

  var empMap = new Point.fromJson({'x': 5, 'y': 6});

  var empX = new Point.alongXAxis(7);

  var logger = new Logger("UI");
  logger.log("Button clicked");

  var pointTwo = new PointTwo(12, 24);
}

class Point {
  int x;
  int y;

  // 1 构造函数
  Point(this.x, this.y);

  // 2 命名构造函数
  Point.fromJson(Map json) {
    x = json['x'];
    y = json['y'];
  }

  // 4 除了调用父类的构造函数，还可以在构造函数体运行之前初始化实例变量
  Point.fromJsonMap(Map jsonMap)
      : x = jsonMap['x'],
        y = jsonMap['y'] {
    print("In Point.fromJson(): ($x, $y)");
  }

  // 5 构造函数可以重定向到同类的另一个构造函数。这里重定向到 Point(this.x, this.y) 构造函数。
  Point.alongXAxis(int x) : this(x, 0);
}

class Person {
  int age;
  String name;

  Person(this.age, this.name);

  Person.fromJson(Map data) {
    print("in Person");
  }
}

class Employee extends Person {
  int age;
  String name;

  // Employee(this.age, this.name);  // 会报错
  Employee(this.age, this.name) : super(age, name);

  // 3 子类构造函数调用父类的默认构造函数，如果父类没有默认构造函数，必须手动调用父类的构造函数，在 : 号后面指定父类的构造函数
  Employee.fromJson(Map data) : super.fromJson(data) {
    print("in Employye");
  }
}

class ImmutablePoint {
  final int x;
  final int y;

  // 6 想让类生成的对象永远不会改变，可以让这些对象变成编译时常量，定义一个const构造函数并确保所有实例变量是final的
  const ImmutablePoint(this.x, this.y);

  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  // 7 使用factory关键字实现构造函数时，不一定要创建一个类的新实例，例如，一个工厂的构造函数可能从缓存中返回一个实例，或者返回一个子类的实例
  // todo 工厂构造函数 有何用？
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

class PointTwo {
  int x;
  int y;

  PointTwo(this.x, this.y);

  // 8 实例对象可以访问实例变量和方法
  double distanceTo(PointTwo other) {
    int dx = x - other.x;
    int dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class Rectangle {
  int left;
  int top;
  int width;
  int height;

  Rectangle(this.left, this.top, this.width, this.height);

  // 9 getter 和 setter是特殊的方法，可以读写访问对象的属性
  // 每个实例变量都有一个隐式的getter，适当的加上一个setter，可以通过实现 getter 和 setter 创建附加属性，使用 get 和 set 关键词
  int get right => left + width;

  set right(int value) => left = value - width;

  int get bottom => top + height;

  set bottom(int value) => top = value - height;
}

// 10 实例、getter 和 setter 方法可以是抽象的，抽象方法使用分号; 而不是方法体
abstract class Doer {
  //...定义实例变量和方法...

  //定义一个抽象方法
  void doSomething();
}

class EffectiveDoer extends Doer {
  void doSomething() {
    //...实现一个抽象方法...
  }
}

// 11 重写运算符
class Vector {
  final int x;
  final int y;

  const Vector(this.x, this.y);

  // 重写 + (a+b)
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }

  // 重写 - (a-b)
  Vector operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
}

// 12 使用 abstract 修饰符定义的抽象类 不能被实例化
// 抽象类用于定义接口，常用于实现
// 抽象类里通常有抽象方法，有抽象方法的不一定是抽象类
abstract class AbstractContainer {
  //...定义构造函数,字段、方法...

  //抽象方法
  void updateChildren();
}

// print(Color.red.name);  // red
// 13 静态变量 即类变量，是类的常量
class Color {
  // 静态常量
  static const red = const Color("red");

  // 不可变的实例变量
  final String name;

  // 构造常量函数
  const Color(this.name);
}

class PointStatic {
  int x;
  int y;

  PointStatic(this.x, this.y);

  // 14 静态方法 即类方法，没有实例，因此无法通过实例访问
  static double distanceBetween(PointStatic a, PointStatic b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}
