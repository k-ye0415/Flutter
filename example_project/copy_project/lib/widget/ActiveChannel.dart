import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:flutter/material.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../screen/ConversationScreen.dart';
import 'TabWidget.dart';

class ActiveChannel extends StatelessWidget {
  const ActiveChannel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        final title = "Home group";
        Nav.push(ConversationScreen(
          title: title,
          memberCount: "(3)",
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizontalLine(
            height: 3,
          ),
          Container(
            color: Color(0xFF202020),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 11, bottom: 11, left: 16),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 18,
                          ).pOnly(right: 2),
                          "GroupName".text.color(Colors.white).size(20).bold.make(),
                        ],
                      ).pOnly(bottom: 3),
                      Row(
                        children: [
                          Icon(
                            Icons.call_made_outlined,
                            color: Colors.green,
                            size: 18,
                          ).pOnly(right: 2),
                          "UserName".text.size(13).color(Colors.white).make(),
                        ],
                      ),
                    ],
                  ).pOnly(left: 16),
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
          HorizontalLine(
            height: 3,
          ),
        ],
      ),
    );
  }
}
