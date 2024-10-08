import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter 의 Constraint"),
        ),
        body: Body(),
      ),
    ));

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // 부모와 자식의 객체에서 사이즈를 공유하는특징이 있음.
    return Container(
        color: Colors.blue[100],
        height: 500,
        width: 500,
        child: Center(
          child: Container(
            constraints: BoxConstraints.loose(Size(200, 200)),
            // BoxConstraints.tight(Size(200, 200)), // 좀더 강제성이 강한. // 얘는 container 사이즈 선언해둬 Size 객체에 선언된 크기로 지정 됨.
            // BoxConstraints(
            //   minHeight: 200,
            //   minWidth: 200,
            //   maxHeight: 250,
            //   maxWidth: 250,
            // ),
            // loose 를 사용하게 되면 아마 아무 차이가 없을거임.
            // width: 300,
            // height: 300,
            color: Colors.red[100],
            padding: EdgeInsets.all(9),
            // BoxConstraints.loose(Size(200, 200)), 를 선언해도 container 의 50 크기에 맞춰짐. maxSize 처럼 생각해도 될것같음.
            child: Container(
              width: 350,
              margin: EdgeInsets.all(15),
              height: 350,
              color: Colors.green[100],
            ),
          ),
        )
        // SingleChildScrollView( // 해당 위젯은 세로에 대한 제약조건이 scrollView 에 잇기에 width 가 적용되지만, 가로는 제약조건이 부모객체에 있기에 적용안됨.
        //   child: Container(
        //     color: Colors.red[100],
        //     width: 300,
        //     height: 300,
        //   ),
        // ),
        );
  }
}
