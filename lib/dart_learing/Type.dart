class A {
  int a;
  int b;

  A(this.a, this.b);
}

class B {
  String a;
  String b;

  B(this.a, this.b);
}

class C {
  /// Type: Runtime representation of a type 类型的运行时表示
  /// 接受一个任意类型的T，然后返回这个类型（注意不是这个类型的实例）
  static Type _typeOf<T>() => T;

  static void showA() {
    final messageA = _typeOf<A>();
    print(messageA);
  }

  void showB() {
    final messageB = _typeOf<B>();
    print(messageB);
  }
}

void main() {
  A a = new A(1, 2);
  B b = new B("1", "2");

  /// 输出 A 类型
  C.showA();

  /// 输出 B 类型
  C c = new C();
  c.showB();
}
