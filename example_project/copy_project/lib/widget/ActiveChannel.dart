import 'package:copy_project/data/group/Group.dart';
import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:flutter/material.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../screen/ConversationScreen.dart';
import 'TabWidget.dart';

class ActiveChannel extends StatelessWidget {
  final Group? group;

  const ActiveChannel({
    super.key,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return group == null
        ? Container(
            height: 66,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(radius10),
              color: Color(0xFF202020),
            ),
            child: Center(
              child: "No group assigned".text.size(14).color(Color(0xFFb2b2b2)).make(),
            ),
          ).pOnly(top: 8)
        : Tap(
            onTap: () {
              Nav.push(ConversationScreen(
                title: group?.groupName ?? "",
                memberCount: group != null ? "(${group!.memberList.length})" : "",
              ));
            },
            child: Container(
              height: 66,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(radius10),
                color: Colors.blue,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.home,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ).pOnly(right: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 18,
                            ).pOnly(right: 2),
                            group!.groupName.text.color(Colors.white).size(20).bold.make(),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.call_made_outlined,
                              color: Colors.green,
                              size: 18,
                            ).pOnly(right: 2),
                            group!.memberList[3].displayName.text
                                .size(13)
                                .color(Colors.white)
                                .make(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 11, bottom: 11, left: 16),
                    width: 47,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFc12335),
                    ),
                    child: Center(
                      child: "End".text.bold.size(16).white.make(),
                    ),
                  ).pOnly(right: 16),
                ],
              ),
            ),
          );
  }
}
