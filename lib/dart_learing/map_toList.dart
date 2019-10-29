void main() {
  List listA = [
    new ModelDemo(1, "1"),
    new ModelDemo(2, "2"),
    new ModelDemo(3, "3"),
  ];

  // todo 为什么不print出来
  listA.map((r) {
    print(r);
  });

  // todo 为什么这里就可以print出来
  listA.map((r) {
    print(r);
  }).toList();
}

class ModelDemo {
  int id;
  String content;

  ModelDemo(this.id, this.content);
}
