void main() {
  // String test = "Hello world";
  // print(test);
  // int num = 100;
  // switch (num) {
  //   case > 10: // (num > 10) 수식인데, 이미 switch 에서 num 을 알고 있기에 > 10 만 작성.
  //   default:
  // }
  //
  // ///
  // /// for / for in / while / do - while
  // ///
  //
  // for (int i = 0; i < 10; i++) {}
  //
  // List<int> numList = [0, 1, 2, 3, 4, 5];
  // for (final item in numList) {
  //   // list 에 담겨있는 item 앞에 final 이라는 키워드를 작성.
  // }
  //
  // ///
  // /// while
  // ///
  // bool isRunning = true;
  // int count = 0;
  //
  // while (isRunning) {
  //   if (count >= 5) {
  //     isRunning = false;
  //   }
  //   count++;
  // }
  //
  // /// try - catch
  // try {
  //   print(10 ~/ 0);
  // } catch (error, stack) {
  //   // on 키워드가 없으면 모든 exception 을 다 보여주는 듯.
  //   print(error);
  //   print(stack);
  // }
  //
  // print("object");
  //
  // /// on
  // int? num2 = null;
  // try {
  //   print(num2!);
  // } on TypeError catch (error, stack) {
  //   // on 키워드는 android 에서 exception 을 명치하는 것 같음.
  //   print(error);
  //   print(stack);
  // }
  //
  // /// throw
  // try {
  //   throw Exception("Unknown Error");
  // } catch (e, s) {
  //   rethrow; // 모르는 에러가 발생 했을 때 다시 throw 를 던지기때문에 잘 써야함.
  // }

  ///  async / await / Future : 1 회만 응답을 돌려 받는 경우 (서버에서 응답받는 경우)
  // Future<void> todo(int second) async {
  //   await Future.delayed(Duration(seconds: second));
  //   print("TODO Done in $second second");
  // }
  //
  // todo(3);
  // todo(1);
  // todo(5);
  ///  async* / yield / Stream : 지속적으로 응답을 돌려받는 경우 (Timer 돌리는 경우)
  Stream<int> todo() async* {
    print("Todo");
    int counter = 0;
    while (counter <= 10) {
      counter++;
      await Future.delayed(Duration(seconds: 1));
      print("TODO is Running $counter");
      yield counter; // 수시로 return 해주는 것
    }
    print("TODO is Done");
  }

  todo().listen((event) {});
}
