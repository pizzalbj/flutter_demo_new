import 'dart:convert';

void main() {
  List listA = ["a", "b", "c", "d", "e", "f"];
  print(listA);

  // no index
  listA.map((d) {
    print(d);
  });

  print("");

  // get index 为什么不行
  listA.asMap().keys.map((int index) {
    print("index $index");
    print("value ${listA[index]}");
  });

  print("");

  // list => string, string => list
  List listB = [
    {"id": 1, "content": "A"},
    {"id": 1, "content": "B"}
  ];
  String listBStr = json.encode(listB);
  print(listBStr);
  var listBTwo = json.decode(listBStr);
  print(listBTwo);
  print(listBTwo[0]);
  print("");

  // 这个牛逼
  final regExp = new RegExp(r'(?:\[)?(\[[^\]]*?\](?:,?))(?:\])?');
  final input = '[sometext],[122],[411]]';
  final result = regExp
      .allMatches(input)
      .map((m) => m.group(1))
      .map((String item) => item.replaceAll(new RegExp(r'[\[\],]'), ''))
      .map((m) => [m])
      .toList();
  print(result);
  print(result[0]);
}
