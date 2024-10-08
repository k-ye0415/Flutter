import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:part_7_project_2/screen/new_page.dart';

void main() => runApp(MaterialApp.router(
      theme: ThemeData(useMaterial3: false),
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(path: "/", name: "home", builder: (context, _) => Home()),
          GoRoute(
              path: "/new", name: "new", builder: (context, _) => NewPage()),
          GoRoute(
              path: "/new1",
              name: "new1",
              builder: (context, _) => NewPage2(),
              routes: [] // route 라이브러리는 해당 route 에도 또 다른 route 를 선언할 수 있음.
              )
        ],
      ),
    )
        // MaterialApp(
        //   theme: ThemeData(useMaterial3: false),
        //   home: Home(),
        // )
        );

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
              context.pushNamed("new");
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return NewPage();
              // }));
            },
            child: Text("Go to Page")),
      ),
    );
  }
}
