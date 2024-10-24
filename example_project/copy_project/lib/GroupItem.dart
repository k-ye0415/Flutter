import 'package:copy_project/VerticalLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

import 'data/group/Group.dart';

class GroupItem extends StatelessWidget {
  final Group group;
  final int index;

  const GroupItem(this.group, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.green[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20,top: 10),
        child: index == 0 ? group.priority.name.toString().toUpperCase().text.make() : null,
      ),

      /// content
      // child: Row(
      //   children: [
      //     SvgPicture.asset(group.groupIcon),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           children: [
      //             // group name,
      //             // member count
      //             group.groupName.text.size(21).make(),
      //             "(${group.memberList.length})".text.size(21).make(),
      //           ],
      //         ),
      //         group.groupDescription.text.make(),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
