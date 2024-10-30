import 'package:copy_project/data/settings/Settings.dart';
import 'package:get/get.dart';

abstract mixin class SettingProvider {
  late final settingProvider = Get.find<SettingsData>();
}

class SettingsData extends GetxController {
  Rx<Setting> dndSetting = Setting(SettingType.DND, false).obs;
  Rx<Setting> scanListSetting = Setting(SettingType.ScanList, false).obs;
  Rx<Setting> zoneGroupSetting = Setting(SettingType.ZoneGroup, false).obs;
  Rx<Setting> covertSetting = Setting(SettingType.CovertMode, false).obs;
  Rx<Setting> focusSetting = Setting(SettingType.FocusMode, false).obs;
}
