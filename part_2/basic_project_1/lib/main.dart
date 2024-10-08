import 'package:flutter/material.dart';

// 앱의 시작점
void main() => runApp(MyApp()); // 최상위 함수
                    // MyApp() 커스텀 앱. app 을 실행 할때 받아야하는 위젯

// main(), runApp() 함수이기때문에 소문자로 시작
// MyApp() 위젯이지만 class 이기때문에 대문자로 시작.

// 최상위 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  app 을 통칭하는 부분.
    return MaterialApp( // memo : 뭔가 MaterialApp 이거 옛날 것 같은데...? 찾아봐야할 것 같다. 기본 생성은 `Placeholder` 이다.
      title: "First app",
      theme: ThemeData(
        useMaterial3: false, // https://dev-tatolee.tistory.com/entry/플러터-flutter-primarySwatch-적용-안-됨-적용하는-방법
        primarySwatch: Colors.green
      ),
      home: MyHomePage(), // app 이 정상적으로 실행되었을 때 가장 먼저 보여지는 이동 경로
    );
  }
}

// 커스텀 위젯을 만들 때 stateless or stateful 으로 만들 지 UI 그릴 때 생각해봐야함.
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app 내의 UI
      appBar: AppBar(
        title: Text("No.1"),
      ),
      body: Center(
        child: Column( // 세로로 그려주는것, vertical 과 같은거쥬~
          children: [
            Text("Hello"),
            Text("Hello"),
            Text("Hello")
          ],
        ),
      ),
    );
  }
}
