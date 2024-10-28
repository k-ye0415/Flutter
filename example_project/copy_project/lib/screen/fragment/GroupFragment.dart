import 'package:copy_project/screen/ConversationScreen.dart';
import 'package:copy_project/common/GroupDataProvider.dart';
import 'package:copy_project/widget/item/GroupItem.dart';
import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

class GroupFragment extends StatefulWidget {
  const GroupFragment({super.key});

  @override
  State<GroupFragment> createState() => _GroupFragmentState();
}

class _GroupFragmentState extends State<GroupFragment> with GroupDataProvider {
  @override
  void initState() {
    Get.put(GroupData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CategoryWidget(title: "Special"),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: groupData.specialGroup.length,
              itemBuilder: (context, index) {
                final group = groupData.specialGroup[index];
                return GroupItem(
                  group,
                  index,
                  groupData.specialGroup.lastIndex ?? 0,
                  onItemTap: () {},
                  onArrowTap: () {
                    Nav.push(ConversationScreen(title: group.groupName, memberCount: "(${group.memberList.length})",));
                  },
                );
              },
            ),
          ),
          const CategoryWidget(title: "Groups"),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: groupData.normalGroup.length,
              itemBuilder: (context, index) {
                final group = groupData.normalGroup[index];
                return GroupItem(
                  group,
                  index,
                  groupData.normalGroup.lastIndex ?? 0,
                  onItemTap: () {},
                  onArrowTap: () {
                    Nav.push(ConversationScreen(title: group.groupName, memberCount: "(${group.memberList.length})",));
                  },
                );
              },
            ),
          ).pOnly(bottom: 150),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String title;

  const CategoryWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.green[100],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: title.text.bold.make(),
      ),
    );
  }
}
