import 'package:copy_project/common/CommonProvider.dart';
import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/screen/MainScreen.dart';
import 'package:copy_project/widget/ui_widget/VerticalLine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/EditTextWidget.dart';
import '../widget/RoundedButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final idTextController = TextEditingController();
  final pwTextController = TextEditingController();

  @override
  void initState() {
    idTextController.addListener(() {
      setState(() {});
    });

    pwTextController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Material(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: context.appColors.defaultBackground,
            child: Column(
              children: [
                Container(
                  height: 29,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "FirstNetCopy".text.bold.color(Colors.white).size(29).make(),
                      VerticalLine(
                        width: 1,
                        color: Colors.white,
                      ).pSymmetric(h: 10, v: 5),
                      "MCPTX 4.5".text.color(Colors.white).make(),
                    ],
                  ),
                ).pOnly(top: 120),
                HeightBox(60),
                EditTextWidget(idTextController, hint: "한번 클릭해주세요!!"),
                HeightBox(12),
                EditTextWidget(
                  pwTextController,
                  hint: "키보드 높이때문에 그래요!!!",
                ),
                HeightBox(24),
                RoundedButton(
                  text: "Sign in",
                  bgColor: context.appColors.pointColor,
                  onTap: () {
                    debugPrint("Login Screen keyboardHeight : $keyboardHeight");
                    Nav.clearAllAndPush(MainScreen(keyboardHeight));
                  },
                ),
              ],
            ).pSymmetric(h: 20),
          ),
        ),
      ),
    );
  }
}
