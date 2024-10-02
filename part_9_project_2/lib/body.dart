import 'package:flutter/material.dart';
import 'package:part_9_project_2/screen/home_screen.dart';
import 'package:part_9_project_2/screen/search_screen.dart';

class InstaBody extends StatelessWidget {
  final int index;

  const InstaBody({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return HomeScreen();
    } else {
      return SearchScreen();
    }
  }
}
