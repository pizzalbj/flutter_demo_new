void main() {
  // 浅拷贝(shallow copy)，新对象只是原对象的一个引用
  // 深拷贝(deep copy)，将原对象的各项属性的“值“都拷贝过来，是“值”不是引用

  // 浅拷贝
  List<dynamic> listOne = [1, "1"];
  var listTwo = listOne;
  listTwo[0] = 0;
  print(listOne);
  print(listTwo);

  print("");

  // 深拷贝
  List listA = [1, [2.1, 2.2, 2.3], 3];
  List listB = List.from(listA);
  List listC = List.of(listA);
  listA[0] = 0;
  print(listA);
  print(listB);
  print(listC);
}
