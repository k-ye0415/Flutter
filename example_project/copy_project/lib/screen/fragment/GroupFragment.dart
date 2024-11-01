import 'package:copy_project/common/CommonProvider.dart';
import 'package:copy_project/common/database/GroupviewModel.dart';
import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/screen/ConversationScreen.dart';
import 'package:copy_project/data/group/GroupDataProvider.dart';
import 'package:copy_project/screen/MainScreen.dart';
import 'package:copy_project/widget/item/GroupItem.dart';
import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/group/Group.dart';

class GroupFragment extends ConsumerStatefulWidget {
  const GroupFragment({super.key});

  @override
  ConsumerState createState() => _GroupFragmentState();
}

class _GroupFragmentState extends ConsumerState<GroupFragment>
    with GroupDataProvider, CommonProvider {
  @override
  void initState() {
    Get.put(GroupData());
    Get.put(KeyboardHeight());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);
    final groupViewModel = ref.watch(groupViewModelProvider);
    //
    // if (groupViewModel.groupList.isEmpty) {
    //   groupViewModel.loadGroups();
    // }
    //
    // final emergencyGroup = groupViewModel.groupList
    //     .filter((group) => group.groupName.contains("Emergency"))
    //     .firstOrNull();
    // groupData.emergencyGroup.value = emergencyGroup;
    //
    // final homeGroup =
    //     groupViewModel.groupList.filter((group) => group.groupName.contains("Home")).firstOrNull();
    // groupData.homeGroup.value = homeGroup;
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() {
            return _SelectedTargetLayout(context);
          }),
          _groupListView(
            "Special",
            groupViewModel.groupList.where((group) {
              return (group.groupName.toLowerCase()).contains(searchQuery.toLowerCase());
            }).toList(),
            searchQuery,
          ).pOnly(bottom: keyboardHeight.height.value),
        ],
      ),
    );
  }

  AnimatedSwitcher _SelectedTargetLayout(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: groupData.selectedGroup.value != null
          ? Container(
              key: ValueKey("groupInfo"),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "${groupData.selectedGroup.value!.groupName} is Selected"
                            .text
                            .color(Colors.white)
                            .size(13)
                            .make(),
                        "Hold PTT button to switch.".text.color(Color(0xFF858585)).size(11).make()
                      ],
                    ).pOnly(top: 8, left: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        groupData.selectedGroup.value = null;
                      });
                    },
                    child: "Deselect".text.color(context.appColors.pointColor).size(13).make(),
                  ).pOnly(right: 20),
                ],
              ),
            )
          : goneWidget,
    );
  }

  Widget _groupListView(String title, List<Group> list, String searchText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // CategoryWidget(title: title),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final group = list[index];
            final showCategory = index == 0 || list[index].priority != list[index - 1].priority;
            return GroupItem(
              group,
              index,
              searchText: searchText,
              list.lastIndex ?? 0,
              showCategory: showCategory,
              isSelected: groupData.selectedGroup.value == group,
              onItemTap: () {
                if (groupData.selectedGroup.value == group) {
                  groupData.selectedGroup.value = null;
                } else {
                  groupData.selectedGroup.value = group;
                }
              },
              onArrowTap: () {
                Nav.push(ConversationScreen(
                  title: group.groupName,
                  memberCount: "(${group.memberList.length})",
                ));
              },
            );
          },
        ),
      ],
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
        color: Color(0xFF202020),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
        child: title.text.bold.color(Color(0xFFa6a6a6)).size(14).make(),
      ),
    );
  }
}
