import 'dart:async';

import 'package:copy_project/data/group/GroupDataProvider.dart';
import 'package:copy_project/screen/ConversationScreen.dart';
import 'package:copy_project/screen/LoginScreen.dart';
import 'package:copy_project/widget/TabWidget.dart';
import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:copy_project/widget/ui_widget/VerticalLine.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

class EmergencyDialog extends DialogWidget {
  EmergencyDialog({super.key});

  @override
  DialogState<EmergencyDialog> createState() => _EmergencyDialog();
}

class _EmergencyDialog extends DialogState<EmergencyDialog> with GroupDataProvider {
  int count = 5;
  Timer? _timer;

  @override
  void initState() {
    Get.put(GroupData());
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 1) {
        setState(() {
          count--;
        });
      } else {
        timer.cancel();
        _sendEmergencyAlert();
      }
    });
  }

  void _sendEmergencyAlert() {
    Nav.pop(context);
    final emergencyGroup =
        groupData.groupList.filter((group) => group.groupName == "Emergency Group").first;
    Nav.push(
      ConversationScreen(
        title: emergencyGroup.groupName,
        memberCount: "(${emergencyGroup.memberList.length})",
        isEmergencyAlert: true,
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
              color: Color(0xFF343434)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              "Emergency Alert will be declared in 5 seconds."
                  .text
                  .size(16)
                  .color(Colors.white)
                  .make()
                  .pOnly(top: 28, left: 26, right: 26, bottom: 5),
              "${count}".text.size(22).color(Colors.red).bold.make().pOnly(bottom: 28),
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
                        child: "Decline".text.size(16).color(Colors.white).bold.make(),
                      ).pSymmetric(v: 15),
                    ),
                  ),
                  VerticalLine(),
                  Expanded(
                    child: Tap(
                      onTap: () {
                        _sendEmergencyAlert();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: "Declare now".text.size(16).color(Color(0xFFf16522)).bold.make(),
                      ).pSymmetric(v: 15),
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
