import 'package:copy_project/ConversationScreen.dart';
import 'package:copy_project/GroupDataProvider.dart';
import 'package:copy_project/GroupItem.dart';
import 'package:copy_project/HorizontalLine.dart';
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
                    final title = "${group.groupName} (${group.memberList.length})";
                    Nav.push(ConversationScreen(title: title,));
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
                    Nav.push(const ConversationScreen());
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
