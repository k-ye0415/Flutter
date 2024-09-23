import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// 오른쪽 상단의 debug banner 없애는 것.
      title: "20240923",
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text("20240923"),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 정렬
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/test_image.jpg"),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 60.0, // divider 의 두께가 아니고, 해당 위젯을 기준으로 위/아래의 margin 값을 지정. 여기서는 위 30, 아래 30 으로 보면 됨.
              color: Colors.grey[850],
              thickness: 0.5, // 선의 두께
              // endIndent:
              //     30.0, // 끝에서 어느 정도 떨어져야 하는지 // 그냥...... padding 에다가 하면 안되낭...
            ),
            Text(
              "Name",
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "20240923",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold // 글자 굵기
                  ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Name LEVEL",
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "14",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold // 글자 굵기
                  ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "using lightsaber",
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "face hero tatto",
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "fire flames",
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                ),
              ],
            ),
            SvgPicture.asset("assets/ic_check_off.svg"),
          ],
        ),
      ),
    );
  }
}


/**
 * project 내부의 이미지 사용할 때 필요한 것.
 * 1. pubspec.yaml 에서
 *    assets:
    - assets/ic_check_off.svg
    - assets/test_image.jpg
    처럼 경로를 지정해줘야함.
 *
 * 2. 실제 사용할 dart 에서 위젯으로 불러온다.
 *
 *
 * SVG 파일을 사용할 때,
 * 1. pubspec.yaml 에서 dependencies 를 추가해야한다.
 *  터미널 명령어 : flutter pub add flutter_svg
 *  자동으로 추가 된다.
 *
 *  2. 실제 사용할 dart 에서 SvgPicture.asset 해준다.
 * */
