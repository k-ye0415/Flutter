import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  print("가위 바위 보 입력");
  final String userInput = stdin.readLineSync(encoding: utf8) ?? "Error";

  const selectList = ["가위", "바위", "보"];
  final cpuInput = selectList[Random().nextInt(3)];

  final result = getResult(userInput, cpuInput);
  print(result);
}

String getResult(String userInput, String cpuInput) {
  final cpuWin = "넌 졌어";
  final playWin = "올?";
  final draw = "비김";
  String result = draw;
  switch (userInput) {
    case "가위":
      if (cpuInput == "바위") {
        result = cpuWin;
      }

      if (cpuInput == "보") {
        result = playWin;
      }
    case "바위":
      if (cpuInput == "보") {
        result = cpuWin;
      }

      if (cpuInput == "가위") {
        result = playWin;
      }
    case "보":
      if (cpuInput == "가위") {
        result = cpuWin;
      }

      if (cpuInput == "바위") {
        result = playWin;
      }
    default:
      result = "올바른 값을 입력하거라";
  }
  return result;
}
