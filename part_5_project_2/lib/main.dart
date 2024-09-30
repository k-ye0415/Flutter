import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Callback"),
        ),
        body: Body(),
      ),
    ));

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Count : $value",
        style: TextStyle(fontSize: 30),
      ),
      TestButton(addCounter)
    ]);
  }

  // 파라미터가 없는 callback 인 경우
  // void addCounter() {
  //   setState(() {
  //    ++value;
  //   });
  // }

  // 파라미터가 있는 callback 인 경우
  void addCounter(int addValue) {
    setState(() {
      value = addValue + value;
    });
  }
}

class TestButton extends StatelessWidget {
  const TestButton(this.callback, {super.key});

  // 파라미터가 없는 callback 인 경우 "VoideCallback" 을 사용하고,
  // final VoidCallback callback;
  // 파라미터가 있는 callback 인 경우 "Funcation(타입)" 을 사용해야한다.
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        child: GestureDetector(
          // GestureDetector 에 기능이 더 많지만,
          // InkWell 에는 리플이 적용되어있음.
          // onTap: () => callback.call(), // 파라미터가 없는 callback 인 경우에는 그냥 call 을 호출하지만,
          onTap: () => callback.call(5), // 파라미터가 있는 callback 인 경우에는 call 을 호출할 때 필요한 파라미터를 보내줘야한다.
          child: Center(
              child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all()),
            child: Text(
              "Up Counter",
              style: TextStyle(fontSize: 24),
            ),
          )),
        ));
  }
}
