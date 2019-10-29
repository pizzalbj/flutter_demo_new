void main() {
  ///
  /// ?.
  Animal animal = new Animal('cat');
  Animal empty = null;
  // animal 非空，返回 animal.name 的值 cat
  print(animal?.name);
  // empty 为空，返回 null
  print(empty?.name);
  // animal 非空，可以直接访问 animal.name 的值 cat
  print(animal.name);
  // empty 为空，抛出异常!!!   重点：?.可以避免抛出异常
  print(empty.name);

  ///
  /// 下一个操作符
}

class Animal {
  final String name;

  Animal(this.name);
}
