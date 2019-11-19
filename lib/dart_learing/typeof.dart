/// 我们需要注意一个对象或者一个值,是否是哪个类型
/// 第一,对照返回值, 第一对照它的参数个数和参数的类型,如果两者都f符合,那么我们就能确定它是我们说的那个类型
void main() {
  print(plusNum is Add);
}

int plusNum(int x, int y) {
  return x + y;
}

typedef int Add(int a, int b);
