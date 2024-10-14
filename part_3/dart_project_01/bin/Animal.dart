abstract class Animal {
  Animal(this.age);

  int age;

  void eat(){
   print("먹는다");
  }
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

class Bird extends Animal with CanFly {
  Bird(super.age);

  @override
  void eat() {
    print("촵촵");
  }
}
