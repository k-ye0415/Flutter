import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData( // theme 는 전역변수로 따로 빼서 사용하는 것이 좋음.
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          textTheme: TextTheme(
            bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 30)
          )
          // ColorScheme.fromSeed(seedColor: Colors.indigo) // primary 색상을 지정해주면 어울리는 색을 자동으로 지정해주는 것.

        //   ColorScheme.light(
        //     primary: Colors.indigo,
        //     secondary: Colors.green,
        //     tertiary: Colors.amber
        //   ),
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Colors.grey
        // )
      ),
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless vs Stateful"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExampleStateless(),
      ExampleStateful(index: 3),
    ]);
  }
}

class ExampleStateless extends StatelessWidget {
  const ExampleStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.green[100],
      ),
    );
  }
}

class ExampleStateful extends StatefulWidget {
  final int index;

  const ExampleStateful({required this.index, super.key});

  @override
  State<ExampleStateful> createState() => _ExampleStatefulState();
}

class _ExampleStatefulState extends State<ExampleStateful> {
  // 해당 객체가 상태객체라 부르기에 변수는 여기다 선언해줘야한다.
  // late int index;
  late int _index; // 생성자에게 받아온 파라미터를 read 만 할것이아닌 write 까지 하려면 내부 변수를 선언.

  // int? index; late 또는 ? nullable 처리도 가능
  late TextEditingController textEditingController;

  @override
  void initState() {
    // 변수 및 기타 init 처리하는 부분
    super.initState();
    // index = 5;
    _index = widget.index;
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose(); // resource 잡아먹는 부분을 방지하기위해 선언.
    super.dispose(); // super 전에 해주는게 좋음.
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          // tap 을 진행하면,
          setState(() {
            // state를 다시 set해준다. -> 그래서 UI에 반영이 됨.
            if (_index == 5) {
              _index = 0;
              return;
            }
            _index++;
          });
        },
        child: Container(
          color: Colors.amber[100],
          child: Center(
            child: Text("$_index"),
          ),
        ),
      ),
    );
  }
}
