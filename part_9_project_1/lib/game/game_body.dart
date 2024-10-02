import 'dart:math';

import 'package:flutter/material.dart';
import 'package:part_9_project_1/game/enum.dart';
import 'package:part_9_project_1/game/widget/user_input.dart';

import 'widget/cpu_input.dart';
import 'widget/game_result.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  InputType? _userInput;
  late InputType _cpuInput;

  @override
  void initState() {
    super.initState();
    isDone = false;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CpuInput(isDone: isDone, cpuInput: _cpuInput), // 생성자로 값 전달
        ),
        Expanded(
          child: GameResult(
            isDone: isDone,
            callback: reset, // callback 은 '()' 가 붙지 않음.
            result: getResult(),
          ),
        ),
        Expanded(
            child: UserInput(
          isDone: isDone,
          callback: setUserInput,
          userInput: _userInput,
        )),
      ],
    );
  }

  void setUserInput(InputType userInput) {
    setState(() {
      isDone = true;
      _userInput = userInput;
    });
  }

  void setCpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }

  Result? getResult() {
    if (_userInput == null) return null;

    switch (_userInput!) {
      case InputType.rock:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.draw;
          case InputType.scissors:
            return Result.playerWin;
          case InputType.paper:
            return Result.cpuWin;
        }
      case InputType.scissors:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.cpuWin;
          case InputType.scissors:
            return Result.draw;
          case InputType.paper:
            return Result.playerWin;
        }
      case InputType.paper:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.playerWin;
          case InputType.scissors:
            return Result.cpuWin;
          case InputType.paper:
            return Result.draw;
        }
    }
  }

  void reset() {
    setState(() {
      isDone = false;
      setCpuInput();
    });
  }
}
