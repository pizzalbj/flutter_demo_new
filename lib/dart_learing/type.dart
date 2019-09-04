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
  /// type: Runtime representation of a type 类型的运行时表示。todo: 它和 T 的区别是什么
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

  C.showA();

  C c = new C();
  c.showB();
}
