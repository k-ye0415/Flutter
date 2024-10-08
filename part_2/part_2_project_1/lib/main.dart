import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: Scaffold(
          // scaffold 는 app 의UI 를 그려주는 도화지같은 것
          appBar: AppBar(
            title: Text("Study to Container"),
          ),
          body: CustomContainer(),
        ),
      ),
    );

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // container 같은건 android 에서 layout 으로 감싸듯 생각할 수 있을 것 같다.
      width: 300,
      //double.infinity, // 좌 우 꽉 채우는 것. match 같은거
      height: 300,
      // color: Colors.blue.shade100,
      // color: Color(0xFFBFFBBB), // 색상 코드 입력 시
      padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
      decoration: BoxDecoration(
        // BoxDecoration 과 container 의 color widget 은 같이 쓸 수 없음.
        color: Color(0xFFBFFBBB),
        border:
            Border.all(color: Colors.green, width: 4, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(6, 6),
              blurRadius: 10,
              spreadRadius: 10)
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Container(child: Center(child: Text("Hello, Constainer"))),
    );
  }
}
