main() {
  /// 객체지향 프로그래밍 특징

  /// 1. 추상화 (Abstraction)
  /// - Abstract Class (extends - only 1)
  /// - Abstract mixin Class (with - n*)
  /// - Abstract Interface Class (implements - n*)

  final bird = Bird(0, "gg");
  bird.fly();
  bird.run();

  /// 2. 상속 (Inheritance)
  /// - Extends

  /// 3. 다형성 (Polymorphism)
  /// - override
  /// - implement

  /// 4. 캡슐화 (Encapsulation)
  /// - private (_ 언더스코어, 언더바)
  /// - method
  /// - get & set
}

abstract class Animal {
  Animal(this.age);

  int age;

  void eat() {
    print("먹는다");
  }
}

abstract mixin class CanRun {
  String legs = "legs";

  void run() {
    print("슈슛");
  }
}

abstract interface class CanRun2 {
  /// 필요한건 getter, setter
  /// 평범한 interface 처럼 메소드 안에 코드를 구성하지 않고 메소드명만 선언
  // String legs = "legs";
  String get legs2;
  set legs2(String value);

  void running();
}

abstract mixin class CanFly {
  String wings = "wings";

  void fly() {
    print("훨훨");
  }
}

class Dog extends Animal {
  Dog(super.age);

  @override
  void eat() {
    print("촵촵");
  }
}

class Bird extends Animal with CanFly, CanRun implements CanRun2 {
  Bird(super.age, this.legs);

  @override
  void eat() {
    print("촵촵");
  }

  @override
  void running() {
    // TODO: implement running
  }
}
