import 'package:fast_app_base/common/common.dart';

import '../../common/util/async/cli_async.dart';

Future<void> main() async {
  /// List 와 Iterable
  final List list = ["blue", "yellow", "red"];
  final iterator = list.iterator;
  print(iterator.current);
  while (iterator.moveNext()) {
    print(iterator.current);
  }


  /// sync* 로 Iterable 만들기

  for (final message in countIterable(5)) {
    print(message);
  }


  /// async* 로 Stream 만들기
  /// yield* 를 통해서 Iterable & Stream 연장시키기


  await for (final message in countStream(3)) {
    print(message);
  }
}

/// 확실한 상태에서 빠르게 작업을 진행해야할 때는 "sync" 를 사용.
Iterable<String> countIterable(int to) sync* {
  for (int i = 1; i <= to; i++) {
//     sleep(1.seconds); dart.io 에 있는 해당 함수를 쓰면 안된다!!!!!!!!
    yield i.toString();
  }
  yield "집에가고싶어요!!!!";

  yield* ["a","b","c"]; // 다 수행 되고 추가적으로 무언가 작업할 때 좋을 듯?
}

/// 언제 끝날지 모르는 작업에서는 "async" 를 사용.
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await sleepAsync(1.seconds);
    yield i;
  }
}