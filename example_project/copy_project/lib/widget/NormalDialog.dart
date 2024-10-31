import 'package:copy_project/screen/LoginScreen.dart';
import 'package:copy_project/widget/TabWidget.dart';
import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:copy_project/widget/ui_widget/VerticalLine.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

class NormalDialog extends DialogWidget {
  final String description;

  NormalDialog({
    super.key,
    required this.description,
  });

  @override
  DialogState<NormalDialog> createState() => _NormalDialogState();
}

class _NormalDialogState extends DialogState<NormalDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              radius10,
            ),
            color: Color(0xFF343434),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.description.text
                  .size(16)
                  .color(Colors.white)
                  .make()
                  .pOnly(top: 28, left: 26, right: 26, bottom: 28),
              HorizontalLine(
                color: Color(0xFF444444),
              ),
              Row(
                children: [
                  Expanded(
                    child: Tap(
                      onTap: () {
                        Nav.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: "Cancel".text.size(16).color(Colors.white).bold.make(),
                      ).pOnly(top: 15, left: 47, right: 47, bottom: 15),
                    ),
                  ),
                  VerticalLine(),
                  Expanded(
                    child: Tap(
                      onTap: () {
                        Nav.pop(context);
                        Nav.clearAllAndPush(LoginScreen());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: "OK".text.size(16).color(Color(0xFFf16522)).bold.make(),
                      ).pOnly(top: 15, left: 47, right: 47, bottom: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ).pSymmetric(h: 30),
      ),
    );
  }
}
