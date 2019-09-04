class TestT<T> {
  int i;
  T data;

  TestT(this.i, this.data);
}

void main() {
  TestT testT = new TestT(1, "String");
  TestT testTTwo = new TestT(1, [1, 2]);
  print(testT);
  print(testTTwo);
  print(testTTwo.data);
}
