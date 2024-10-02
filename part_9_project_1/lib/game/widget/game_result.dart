import 'package:flutter/material.dart';
import 'package:part_9_project_1/game/enum.dart';

class GameResult extends StatelessWidget {
  final bool isDone;
  final Result? result;
  final VoidCallback callback;

  const GameResult(
      {required this.isDone, required this.callback, this.result, super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              result!.displayString,
              style: TextStyle(fontSize: 32),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextButton(onPressed: () => callback.call(), child: Text("다시하기"))
        ],
      );
    }

    return const Center(
      child: Text(
        "가위, 바위, 보 중 하나를 선택해주세요.",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
