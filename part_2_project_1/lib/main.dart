import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: Scaffold(
          // scaffold 는 app 의UI 를 그려주는 도화지같은 것
          appBar: AppBar(
            actions: [
              Icon(Icons.home),
              Icon(Icons.play_arrow),
            ],
            centerTitle: true,
            title: Text("App Bar"),
          ),
          body: TestWidget(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.abc),
            onPressed: (){

            },
          ),
        ),
      ),
    );

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  // 상태 값을 유지한 채 변경하고자 할 때에는 hotreload, 상태 값을 유지하지 않아도 될 때에는 hotrestart 를 하는것이 바람직함.
  // Google -> Material Design
  // Apple -> Cupertino Design

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Hollo, Flutter",
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
