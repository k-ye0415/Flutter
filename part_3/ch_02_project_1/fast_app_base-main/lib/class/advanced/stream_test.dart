import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/class/advanced/future_test.dart';
import 'package:fast_app_base/common/common.dart';

void main() {
  /// Stream 기본 개념
  // Future : 1번의 데이터를 가져옴
  // Stream : 여러번의 데이터를 받을 수 있음


  /// Stream 생성과 수행
  // 1. async*
  countStream(4).listen((event) => {});

  // 2. streamController
  final controller = StreamController<int>();
  final stream = controller.stream;

  stream.listen((event) => {});

  addDataToTheSink(controller);


  /// Stream 데이터 변환
  countStream(4).map((event) => "$event 지남").listen((event) => {});
  // countStream(4).transform(streamTransformer).listen((event) => {}); // 잘 사용하지 않음

  /// 위젯에서 Stream Data 표현하기

  /// Stream 데이터 관찰2 - BroadcastStream

  /// 2개의 위젯에서 하나의 BroadcastStream Data 표현하기

  /// Stream Error Handling
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    // await sleepAsync(1.seconds);
    yield i;
  }
}

void addDataToTheSink(StreamController<int> controller) async {
  for (int i = 1; i <= 4; i++) {
    controller.sink.add(i);
    // await sleepAsync(1.seconds);
  }
}
