import 'package:copy_project/screen/fragment/GroupFragment.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'GroupDummy.dart';
import 'Group.dart';

abstract mixin class GroupDataProvider {
  late final groupData = Get.find<GroupData>();
}

class GroupData extends GetxController {
  List<Group> groupList = <Group>[].obs;
  List<Group> specialGroup = <Group>[].obs;
  List<Group> normalGroup = <Group>[].obs;

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

    // special groupList.filter((group) => group.priority == GroupPriority.special).toList();
    final list = groupList.filter((group) => group.priority == GroupPriority.special).toList();
    specialGroup.addAll(list);

    // normal
    final normalList = groupList.filter((group) => group.priority == GroupPriority.normal).toList();
    normalGroup.addAll(normalList);
    super.onInit();
  }
}
