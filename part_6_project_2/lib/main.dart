import 'package:flutter/material.dart';

const assetImage = "assets/images";

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
        title: Text("로컬 데이터"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("$assetImage/thumnail.jpg"),
    );
  }
}
