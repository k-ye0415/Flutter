import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:part_7_project_2/main.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) 맨처음 보낼 때
                  // Navigator.pop(context); // 단순히 해당 View 없앨 때
                  context.pop();
                },
                child: Text("Go to Main")),
            TextButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return NewPage2();
                  // }));
                  context.pushNamed("new1");
                },
                child: Text("Go to NewPage2")),
          ],
        ),
      ),
    );
  }
}

class NewPage2 extends StatelessWidget {
  const NewPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New New Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Go to back")),
            TextButton(
                onPressed: () {
                  // Navigator.popUntil(context, (route) => route.isFirst); // 맨처음 View로 보낼 때
                  context.goNamed("home");
                },
                child: Text("Go to Main"))
          ],
        ),
      ),
    );
  }
}
