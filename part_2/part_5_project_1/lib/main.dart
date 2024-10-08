import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter 입력!!!"),
        ),
        body: const Body(),
      ),
    ));

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TestCheckBox(),
        TestRadioButton(),
        TestSlider(),
        TestSwitch(),
        TestPopupMenu(),
      ],
    );
  }
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  late List<bool> values;

  @override
  void initState() {
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: values[0],
            onChanged: (value) => changeValue(0, value: value ?? false)),
        // null 체크 방법 1
        Checkbox(
            value: values[1],
            onChanged: (value) => changeValue(1, value: value)),
        Checkbox(
            value: values[2],
            onChanged: (value) => changeValue(2, value: value)),
      ],
    );
  }

  // 내부 함수 선언
  // void changeValue(int index, bool value) {
  void changeValue(int index, {bool? value = false}) {
    // null 체크 방법 2
    setState(() {
      values[index] = value!;
    });
  }
}

class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

enum TestRadioValue { test1, test2, test3 }

class _TestRadioButtonState extends State<TestRadioButton> {
  TestRadioValue? selectValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio<TestRadioValue>(
              value: TestRadioValue.test1,
              groupValue: selectValue,
              onChanged: (value) => setState(() => selectValue = value!)),
          title: Text(TestRadioValue.test1.name),
          onTap: () => setState(() {
            if (selectValue != TestRadioValue.test1) {
              selectValue = TestRadioValue.test1;
            }
          }),
        ),
        Radio<TestRadioValue>(
            value: TestRadioValue.test2,
            groupValue: selectValue,
            onChanged: (value) => setState(() => selectValue = value!)),
        Radio<TestRadioValue>(
            value: TestRadioValue.test3,
            groupValue: selectValue,
            onChanged: (value) => setState(() => selectValue = value!)),
      ],
    );
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$value"),
        Slider(
          value: value,
          onChanged: (newValue) => setState(() {
            value = newValue;
          }),
          divisions: 100,
          max: 100,
          label: value.round().toString(),
          activeColor: Colors.amber,
        ),
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  bool isUsed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
            value: isUsed,
            onChanged: (newValue) => setState(() {
                  isUsed = newValue;
                })),
        CupertinoSwitch(
            value: isUsed,
            onChanged: (newValue) => setState(() {
                  isUsed = newValue;
                }))
      ],
    );
  }
}

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

enum TestValue { test1, test2, test3 }

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestValue selectValue = TestValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$selectValue"),
        PopupMenuButton(
          itemBuilder: (context) {
            return TestValue.values
                .map((value) =>
                    PopupMenuItem(value: value, child: Text(value.name)))
                .toList();
          },
          onSelected: (newValue) => setState(() {
            selectValue = newValue;
          }),
        ),
      ],
    );
  }
}
