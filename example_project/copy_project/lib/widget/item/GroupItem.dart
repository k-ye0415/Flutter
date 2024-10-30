import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
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
  final bool isSelected;

  const GroupItem(
    this.group,
    this.index,
    this.lastIndex, {
    super.key,
    required this.onItemTap,
    required this.onArrowTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final lastItem = index == lastIndex;
    return Tap(
      onTap: onItemTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isSelected ? Color(0xFF35383d) : Color(0xFF202020),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(lastItem ? 20 : 0),
            bottomRight: Radius.circular(lastItem ? 20 : 0),
          ),
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
                                  group.groupName.text.size(18).color(Colors.white).make(),
                                  "(${group.memberList.length})"
                                      .text
                                      .size(18)
                                      .color(Colors.white)
                                      .make(),
                                ],
                              ),
                              group.groupDescription.text
                                  .size(13)
                                  .color(Color(0xFFb2b2b2))
                                  .make()
                                  .pOnly(bottom: 10),
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
                    else
                      goneWidget
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
