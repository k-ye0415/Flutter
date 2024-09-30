import 'package:flutter/material.dart';
import 'package:part_7_project_2/screen/new_page.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("화면 이동"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NewPage();
              }));
            },
            child: Text("Go to Page")),
      ),
    );
  }
}
