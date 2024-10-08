import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("화면이동하기"),
      ),
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
        ],
        currentIndex: index,
        onTap: (newIndex) => setState(() {
          index = newIndex;
        }),
      ),
    );
  }

  Widget body() {
    switch (index) {
      case 1:
        return Center(
          child: Icon(Icons.search, size: 100),
        );
      case 2:
        return Center(
          child: Icon(Icons.person, size: 100),
        );
      case 0:
      default:
        return Center(
          child: Icon(Icons.home, size: 100),
        );
    }
  }
}
