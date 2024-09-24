import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("상하배치하기"),
        ),
        body: Body(),
      ),
    ));

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        // mainAxisSize: MainAxisSize.min, // wrap 같은거
        mainAxisSize: MainAxisSize.max, // match 같은거
        mainAxisAlignment: MainAxisAlignment.center, // gravity 같은거 // 세로 기준
        crossAxisAlignment: CrossAxisAlignment.end, // Column 혼자서는 이 친구 영향을 받지 않음. 해당 친구의 영향을 받기 위해선 column 상위에 container 를 선언 후, 가로 기준을 정해줘야함.
        children: [
          Container(
            width: 100,
            height: 80,
            color: Colors.red[100],
            child: Text("Container 1"),
          ),
          Container(
            width: 100,
            height: 80,
            color: Colors.green[100],
            child: Text("Container 2"),
          ),
          Container(
            width: 100,
            height: 80,
            color: Colors.blue[100],
            child: Text("Container 3"), // 일반적으로 child 는 가장 밑에 위치하는것이 좋음.
          ),
        ],
      ),
    );
  }
}
