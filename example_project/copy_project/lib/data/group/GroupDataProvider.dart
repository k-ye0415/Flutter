import 'package:copy_project/screen/fragment/GroupFragment.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'GroupDummy.dart';
import 'Group.dart';

abstract mixin class GroupDataProvider {
  late final groupData = Get.find<GroupData>();
}

class GroupData extends GetxController {
  RxList<Group> groupList = <Group>[].obs;
  RxList<Group> specialGroup = <Group>[].obs;
  RxList<Group> normalGroup = <Group>[].obs;
  Rxn<Group> selectedGroup = Rxn<Group>();

  @override
  void onInit() {
    final dummyList = [
      emergencyGroup,
      homeGroup,
      normalGroup1,
      normalGroup2,
      normalGroup3,
      normalGroup4,
      normalGroup5,
      normalGroup6,
      normalGroup7,
    ];
    // all
    groupList.addAll(dummyList);
    super.onInit();
  }

  RxList<Group> getSpecialGroup(String search) {
    if (specialGroup.isNotEmpty) specialGroup.clear();

    if (search.isEmpty) {
      final list = groupList.filter((group) => group.priority == GroupPriority.special).toList();
      specialGroup.addAll(list);
    } else {
      final list = groupList
          .filter((group) =>
              group.priority == GroupPriority.special &&
              group.groupName.toLowerCase().contains(search.toLowerCase()))
          .toList();
      specialGroup.addAll(list);
    }
    return specialGroup;
  }

  RxList<Group> getNormalGroup(String search) {
    if (normalGroup.isNotEmpty) normalGroup.clear();

    if (search.isEmpty) {
      final normalList =
          groupList.filter((group) => group.priority == GroupPriority.normal).toList();
      normalGroup.addAll(normalList);
    } else {
      final normalList = groupList
          .filter((group) =>
              group.priority == GroupPriority.normal &&
              group.groupName.toLowerCase().contains(search.toLowerCase()))
          .toList();
      normalGroup.addAll(normalList);
    }
    return normalGroup;
  }
}
