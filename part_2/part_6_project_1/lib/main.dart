import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("외부 라이브러리"),
        ),
        body: Body(),
      ),
    ));

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return RandomWords();
  }
}

class RandomWords extends StatelessWidget {
  const RandomWords({super.key});

  @override
  Widget build(BuildContext context) {
    final wordList = generateWordPairs().take(5).toList();
    final widgets = wordList
        .map((word) => Text(
              word.asCamelCase,
              style: TextStyle(fontSize: 32),
            ))
        .toList();
    return Column(
      children: widgets,
    );
  }
}
