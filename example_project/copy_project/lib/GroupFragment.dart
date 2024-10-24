import 'package:copy_project/GroupItem.dart';
import 'package:copy_project/MainScreen.dart';
import 'package:copy_project/data/GroupDummy.dart';
import 'package:copy_project/data/group/Group.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GroupFragment extends StatefulWidget {
  const GroupFragment({super.key});

  @override
  State<GroupFragment> createState() => _GroupFragmentState();
}

class _GroupFragmentState extends State<GroupFragment> {
  @override
  Widget build(BuildContext context) {
    final specialGroup =
        groupList.filter((group) => group.priority == GroupPriority.special).toList();
    final normalGroup =
        groupList.filter((group) => group.priority == GroupPriority.normal).toList();
    debugPrint(specialGroup.toString());
    debugPrint(normalGroup.toString());
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.green,
            height: 100,
          ),
          Container(
            color: Colors.amber,
            height: 100,
          ),
          Container(
            color: Colors.green,
            height: 100,
          ),
          ListView(
            children: specialGroup.mapIndexed((group, index) => GroupItem(group, index)).toList(),
          ),
          // ListView(
          //   children: normalGroup.mapIndexed((group, index) => GroupItem(group, index)).toList(),
          // )
        ],
      ),
    );
  }
}
