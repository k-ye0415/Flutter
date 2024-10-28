import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:copy_project/widget/TabWidget.dart';
import 'package:copy_project/widget/ui_widget/VerticalLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/group/Group.dart';

class GroupItem extends StatelessWidget {
  final Group group;
  final int index;
  final int lastIndex;
  final VoidCallback onItemTap;
  final VoidCallback onArrowTap;

  const GroupItem(
    this.group,
    this.index,
    this.lastIndex, {
    super.key,
    required this.onItemTap,
    required this.onArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    final lastItem = index == lastIndex;
    return Tap(
      onTap: onItemTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.green[100],
          borderRadius: lastItem
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              : null,
        ),
        child: Container(
          // content
          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(group.groupIcon).pOnly(right: 10), // icon
              Expanded(
                // content
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  group.groupName.text.size(21).make(),
                                  "(${group.memberList.length})".text.size(21).make(),
                                ],
                              ),
                              group.groupDescription.text.make().pOnly(bottom: 10),
                            ],
                          ),
                        ),
                        // make Line
                        IconButton(
                          onPressed: onArrowTap,
                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                    if (!lastItem)
                      const HorizontalLine(
                        color: Colors.grey,
                      ) // divider
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
