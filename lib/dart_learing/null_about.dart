void main() {
  Animal animal = new Animal('cat');
  Animal empty = null;

  /// **** **** ?. 多用 **** ****
  /// 如果 A 等于 null，那么 A?.B 为 null
  /// 如果 A 不等于 null，那么 A?.B 等价于 A.B
  print(animal?.name);
  print(animal.name);

  // empty 为空，返回 null
  print(empty?.name);
  // empty 为空，抛出异常。抛出异常会导致下面的代码执行不了
  // print(empty.name);

  /// **** **** ?? 多用 **** ****
  /// 如果 A 等于 null，那么 A??B 为 B
  /// 如果 A 不等于 null，那么 A??B 为 A
  print(empty?.name ?? 'unknown');
}

class Animal {
  final String name;

  Animal(this.name);
}
