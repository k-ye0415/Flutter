import 'package:copy_project/common/common.dart';
import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:copy_project/widget/TabWidget.dart';
import 'package:copy_project/widget/ui_widget/VerticalLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/group/Group.dart';
import '../../screen/fragment/GroupFragment.dart';

class GroupItem extends StatelessWidget {
  final Group group;
  final int index;
  final int lastIndex;
  final VoidCallback onItemTap;
  final VoidCallback onArrowTap;
  final bool isSelected;
  final String searchText;
  final bool showCategory;

  const GroupItem(
    this.group,
    this.index,
    this.lastIndex, {
    super.key,
    required this.onItemTap,
    required this.onArrowTap,
    required this.isSelected,
    this.searchText = "",
    this.showCategory = false,
  });

  @override
  Widget build(BuildContext context) {
    final lastItem = index == lastIndex;
    return Tap(
      onTap: onItemTap,
      child: Column(
        children: [
          showCategory ? CategoryWidget(title: group.priority.name).pOnly(top: 8) : goneWidget,
          Container(
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
                  SvgPicture.asset("$baseIconPath${group.groupIcon}").pOnly(right: 10), // icon
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
                                      _buildHighlightedText(context, group.groupName, searchText),
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
        ],
      ),
    );
  }

  Widget _buildHighlightedText(BuildContext context, String text, String searchText) {
    if (searchText.isEmpty || !text.toLowerCase().contains(searchText.toLowerCase())) {
      // If there's no match, return the normal text
      return Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    }

    // Find the match and split the text
    final startIndex = text.toLowerCase().indexOf(searchText.toLowerCase());
    final endIndex = startIndex + searchText.length;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text.substring(0, startIndex),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextSpan(
            text: text.substring(startIndex, endIndex),
            style: TextStyle(
                color: context.appColors.pointColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: text.substring(endIndex),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
