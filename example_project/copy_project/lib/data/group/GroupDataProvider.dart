import 'package:copy_project/screen/fragment/GroupFragment.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Group.dart';

abstract mixin class GroupDataProvider {
  late final groupData = Get.find<GroupData>();
}

class GroupData extends GetxController {
  Rxn<Group> selectedGroup = Rxn<Group>();
  Rxn<Group> emergencyGroup = Rxn<Group>();
  Rxn<Group> homeGroup = Rxn<Group>();

  @override
  void onInit() {
    super.onInit();
  }
}
