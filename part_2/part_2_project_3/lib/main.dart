import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: Text("비율 배치하기")),
        body: Body(),
      ),
    ));

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.red[100],
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        // ScrollView 안에 Expanded 를 사용하면 error 가 발생함.
        // Expanded(child: Container(
        //   color: Colors.amber,
        // )),
        // 그래서 Expanded 위젠 안에 empty container 를 만든 후 그 안에 scrollView 를 넣는다.
        Expanded(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red[100],
            margin: EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red[100],
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red[100],
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red[100],
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ],
    );
    //   Column(
    //   children: [
    //     Container(
    //       width: double.infinity,
    //       height: 200,
    //       color: Colors.red[100],
    //     ),
    //     Expanded(// weight 같은 거구만?
    //         child: Container(
    //           height: 100, // 이 놈은 높이를 지정해도 영향이 없음
    //       color: Colors.amber,
    //     )),
    //     Flexible(// weight 같은 거구만?
    //       child: Container(
    //         height: 100, // 하지만 높이를 지정할 경우 해당 높이를 따라 그려짐
    //         color: Colors.blue[100],
    //       ),
    //     ),
    //   ],
    // );
  }
}
