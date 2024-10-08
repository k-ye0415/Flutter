import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widget 겹겹 쌓기"),
        ),
        body: Body(),
      ),
    ));

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack( // widget 이 가장 밑에 선언된 친구가 가장 상위 계층
      children: [
        Container(
          width: 500,
          height: 500,
          color: Colors.grey[900],
        ),
        Container(
          width: 400,
          height: 400,
          color: Colors.grey[850],
        ),
        Container(
          width: 300,
          height: 300,
          color: Colors.grey[800],
        ),
        // Positioned( // 해당 위젯은 정확한 수치로 띄울 때 사용.
        //   bottom: 0, // 해당 기준으로 얼마나 띄울 것인지 판단하는것. 지금 0이면 여백없이 진행
        //   right: 0,
        //   child: Container(
        //     width: 200,
        //     height: 200,
        //     color: Colors.grey[700],
        //   ),
        // ),
        Align( // 해당 위젯은 Alignment 로 위치를 지정해줄 수 있음. // 화면 전체를 잡음.
          alignment: Alignment.topRight,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey[700],
          ),
        )
      ],
    );
  }
}
