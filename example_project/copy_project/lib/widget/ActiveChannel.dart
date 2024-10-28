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
          Row(
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
                        Icon(Icons.call),
                        "GroupName".text.make(),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.call_made_outlined),
                        "UserName".text.make(),
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
                  color: Colors.red,
                ),
                child: Center(
                  child: "End".text.bold.white.make(),
                ),
              ).pOnly(right: 16),
            ],
          ),
          HorizontalLine(
            height: 3,
          ),
        ],
      ),
    );
  }
}
