import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'body.dart';

void main() => runApp(const InstaCloneApp());

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.black),
      ),
      home: const InstaCloneHome(),
    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 0 ?AppBar(
        // appbar 는 별도의 위젯으로 분리하는 것이 까다롭기때문에 그냥 진행하는 것이 좋음.
        title: Text(
          "Instagram",
          style: GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 32),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
              size: 32,
            ),
            onPressed: () {
              print("tab!");
            },
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.paperplane,
              size: 32,
            ),
            onPressed: () {
              print("tab!");
            },
          )
        ],
      ) : null,
      body: InstaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) => setState(() => index = newIndex),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 28,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 28,
            ),
            label: "Search",
          ),
        ],
      ),
    );
  }
}
