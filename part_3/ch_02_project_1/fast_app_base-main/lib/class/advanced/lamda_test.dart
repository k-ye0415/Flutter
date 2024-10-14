import '../../common/dart/collection/sort_functions.dart';

void main(){
  /// 람다의 표현 방식
  // (타입 파라미터1, 타입 파라미터2) => 반환값

  int add1(int a, int b) {
    return a+b;
  }

  int add2(int a, int b) => a + b;

      (int a, int b) => a + b;



  /// 람다의 특징


  /// 1. 익명 : 이름을 지을 수 없다. (변수에 담을 수 있음.)
  /// 2. 함수 : class 에 종속되지 않음.
  /// 3. 전달 : 1급 객체로서 함수 파라미터로 전달, 변수에 저장 가능.
  /// 4. 간결성 : 익명 클래스처럼 많은 코드를 구현할 필요가 없다.

  /// List sort 예제
  final list = [Animal(5, "g"),Animal(3,"sahio"),Animal(2, "2udv"),Animal(6,"dhslg"),Animal(20,"iofehw")];
  list.sort(byStringField<Animal>((element) => element.name));
  print(list);
}

class Animal {
  final int age;
  final String name;
  Animal(this.age, this.name);

  @override
  String toString() {
    return 'Animal : $age, $name';
  }
}
