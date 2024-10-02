import 'package:flutter/material.dart';
import 'package:part_9_project_1/game/enum.dart';

import 'input_card.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final InputType? userInput;
  final Function(InputType) callback;

  const UserInput(
      {this.userInput,
      required this.isDone,
      required this.callback,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Row(
        children: [
          Expanded(child: SizedBox.shrink()),
          Expanded(child: InputCard(child: Image.asset(userInput!.path))),
          Expanded(child: SizedBox.shrink()),
        ],
      );
    }

    return Row(
      children: _getInputs(callback),
    );
  }

  List<Widget> _getInputs(Function(InputType) callback) {
    return InputType.values
        .map((type) => InputCard(
              child: Image.asset(type.path),
              callback: () => callback.call(type),
            ))
        .toList();
  }
}
