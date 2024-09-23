import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Charactor card",
      home: MyCard(),
      theme: ThemeData(
          useMaterial3: false, // memo : 이거 항상 써줘야하는걸까?
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BBANTO"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        elevation: 0.0, // app bar 의 그림자 없애는 부분
      ),
      body: Center( // 이 놈은 가로 기준으로 가운데에 위치하게끔만 함.
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 세로 기준 어디에 위치할지
            children: [
              Text("Hello"),
              Text("Hello"),
              Text("Hello"),
            ],
          ),
      ),
    );
  }
}
