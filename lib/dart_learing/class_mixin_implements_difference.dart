///
/// https://blog.csdn.net/jieqiang3/article/details/90208242
/// Java开发工程师A可以熟练使用Java，C语言
/// Android开发工程师可以熟练使用Java，Kolin语言
/// iOS开发工程师可以熟练掌握oc，c语言

void main() {
  // implements:
  JavaEngineerImplements JI = new JavaEngineerImplements();
  JI.code();
  JI.masterJava();
  JI.masterC();

  AndroidEngineerImplements AI = new AndroidEngineerImplements();
  AI.code();
  AI.masterJava();
  AI.masterKotlin();

  IosEngineerImplements II = new IosEngineerImplements();
  II.code();
  II.masterJava();
  II.masterC();

  print("======= =======");

  // mixin:
  JavaEngineerMixins JM = new JavaEngineerMixins();
  JM.code();
  JM.masterJava();
  JM.masterC();

  AndroidEngineerMixins AM = new AndroidEngineerMixins();
  AM.code();
  AM.masterJava();
  AM.masterKotlin();

  IosEngineerMixins IM = new IosEngineerMixins();
  IM.code();
  IM.masterC();
  IM.masterObjectC();
}

abstract class Engineer {
  void code();
}

abstract class MasterJava {
  void masterJava() {
    print("masterJava");
  }
}

abstract class MasterC {
  void masterC() {
    print("masterC");
  }
}

abstract class MasterKotlin {
  void masterKotlin() {
    print("masterKotlin");
  }
}

abstract class MasterObjectC {
  void masterObjectC() {
    print("masterObjectC");
  }
}

// implements 实现 Java工程师
class JavaEngineerImplements extends Engineer implements MasterJava, MasterC {
  @override
  void code() {
    // TODO: implement code
    print("Java code");
  }

  @override
  void masterC() {
    // TODO: implement masterC
  }

  @override
  void masterJava() {
    // TODO: implement masterJava
  }
}

// implements 实现 Java工程师
class AndroidEngineerImplements extends Engineer
    implements MasterJava, MasterKotlin {
  @override
  void code() {
    // TODO: implement code
    print("Android code");
  }

  @override
  void masterJava() {
    // TODO: implement masterJava
  }

  @override
  void masterKotlin() {
    // TODO: implement masterKotlin
  }
}

// implements 实现 Java工程师
class IosEngineerImplements extends Engineer implements MasterJava, MasterC {
  @override
  void code() {
    // TODO: implement code
    print("Ios code");
  }

  @override
  void masterC() {
    // TODO: implement masterC
  }

  @override
  void masterJava() {
    // TODO: implement masterJava
  }
}

/// 由上面的代码我们可以看到：
/// JavaEngineerImplements 和 AndroidEngineerImplements 实现了同一个 MasterJava 类，然后实现也是一模一样的
/// 所以这就造成了 多个类层次结构中重用类代码
/// 下次的是 mixin 实现

class JavaEngineerMixins extends Engineer with MasterJava, MasterC {
  @override
  void code() {
    // TODO: implement code
    print("Java code");
  }
}

class AndroidEngineerMixins extends Engineer with MasterJava, MasterKotlin {
  @override
  void code() {
    // TODO: implement code
    print("Android code");
  }
}

class IosEngineerMixins extends Engineer with MasterObjectC, MasterC {
  @override
  void code() {
    // TODO: implement code
    print("Ios code");
  }

  @override
  void masterC() {
    print("mixin masterC: 这里重写了 masterC 方法（@override 可写可不写）");
  }
}

/// 总结：
/// Dart implements 和 mixin 都继承抽象类
/// implements 子类实现了某个类，则超类的方法需要再子类里实现
/// mixin 子类混入了某个类，则超类的方法可直接被子类调用，也可以重写超类的方法。
/// 所以说：mixin 比 implements 貌似更高一级，更好用。