import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/data/settings/SettingProvider.dart';
import 'package:copy_project/widget/RippleWidget.dart';
import 'package:copy_project/widget/TabWidget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data/settings/Settings.dart';
import '../widget/BottomSheet.dart';
import '../widget/NormalDialog.dart';
import '../widget/item/SettingItem.dart';
import '../widget/ui_widget/VerticalLine.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> with SettingProvider {
  @override
  void initState() {
    Get.put(SettingsData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "settingProvider.covertSetting.value.isUsed : ${settingProvider.covertSetting.value.isUsed}");
    return SafeArea(
      child: Container(
        color: context.appColors.defaultBackground,
        child: Column(
          children: [
            // user info
            Obx(
              () => _UserInfo(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// section 1
                    /// new gorup
                    /// first-to-answer
                    /// dnd
                    const HeightBox(8),
                    const SettingItem(
                      icon: Icons.add,
                      title: "Create a new group",
                      shapeType: ShapeType.top,
                    ),
                    const SettingItem(
                      icon: Icons.call,
                      title: "Initiate a First-to-Answer call",
                    ),
                    Obx(
                      () => Tap(
                        onTap: () {
                          setState(() {
                            settingProvider.dndSetting.value.isUsed =
                                !settingProvider.dndSetting.value.isUsed;
                          });
                        },
                        child: SettingItem(
                          icon: Icons.do_not_disturb_on_rounded,
                          title: "Do not disturb",
                          usedSwitchAndValue: settingProvider.dndSetting.value,
                          shapeType: ShapeType.bottom,
                          onSwitchChanged: (value) {
                            setState(() {
                              settingProvider.dndSetting.value.isUsed = value;
                            });
                          },
                        ),
                      ),
                    ),

                    /// section 2
                    /// scan list
                    /// zone group
                    const HeightBox(8),
                    Obx(
                      () => Tap(
                        onTap: () {
                          setState(() {
                            settingProvider.scanListSetting.value.isUsed =
                                !settingProvider.scanListSetting.value.isUsed;
                          });
                        },
                        child: SettingItem(
                          icon: Icons.list,
                          title: "Scan list",
                          usedSwitchAndValue: settingProvider.scanListSetting.value,
                          shapeType: ShapeType.top,
                          onSwitchChanged: (value) {
                            setState(() {
                              settingProvider.scanListSetting.value.isUsed = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () => Tap(
                        onTap: () {
                          setState(() {
                            settingProvider.zoneGroupSetting.value.isUsed =
                                !settingProvider.zoneGroupSetting.value.isUsed;
                          });
                        },
                        child: SettingItem(
                          icon: Icons.group,
                          title: "Zone groups",
                          usedSwitchAndValue: settingProvider.zoneGroupSetting.value,
                          shapeType: ShapeType.bottom,
                          onSwitchChanged: (value) {
                            setState(() {
                              settingProvider.zoneGroupSetting.value.isUsed = value;
                            });
                          },
                        ),
                      ),
                    ),

                    /// section 3
                    /// covert mode
                    /// focus mode
                    const HeightBox(8),
                    Obx(
                      () => Tap(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BottomSheetWidget(
                                  title: "Select a mode",
                                  optionList: ["Basic mode", "Covert mode"],
                                  selectedItem: settingProvider.covertSetting.value.isUsed
                                      ? "Basic mode"
                                      : "Covert mode",
                                  onValueChanged: (value) {
                                    setState(() {
                                      debugPrint("value : $value");
                                      value == "Covert mode"
                                          ? settingProvider.covertSetting.value.isUsed = true
                                          : settingProvider.covertSetting.value.isUsed = false;
                                      debugPrint(
                                          "settingProvider.covertSetting.value.isUsed : ${settingProvider.covertSetting.value.isUsed}");
                                    });
                                  },
                                );
                              });
                        },
                        child: SettingItem(
                          icon: Icons.remove_red_eye,
                          title: settingProvider.covertSetting.value.isUsed
                              ? "Basic mode"
                              : "Covert mode",
                          description: "Mute tones, sounds, vibrations, and notification alerts.",
                          shapeType: ShapeType.top,
                          isCovertMode: true,
                        ),
                      ),
                    ),
                    Obx(
                      () => Tap(
                        enabled: settingProvider.zoneGroupSetting.value.isUsed == true,
                        onTap: () {
                          setState(() {
                            settingProvider.focusSetting.value.isUsed =
                                !settingProvider.focusSetting.value.isUsed;
                          });
                        },
                        child: SettingItem(
                          icon: Icons.center_focus_strong,
                          title: "Focus mode",
                          description:
                              "De-affiliate all groups except for the emergency group and hardware key mapped group.",
                          usedSwitchAndValue: settingProvider.focusSetting.value,
                          shapeType: ShapeType.bottom,
                          isEnable: settingProvider.zoneGroupSetting.value.isUsed == true,
                          onSwitchChanged: (value) {
                            setState(() {
                              settingProvider.focusSetting.value.isUsed = value;
                            });
                          },
                        ),
                      ),
                    ),

                    /// section 4
                    /// battery
                    /// setting
                    /// help
                    const HeightBox(8),
                    const SettingItem(
                        isEnable: false,
                        icon: Icons.battery_2_bar_sharp,
                        title: "Low battery reporting frequency",
                        description: "Adjust your location reporting frequency.",
                        shapeType: ShapeType.top),
                    const SettingItem(
                      icon: Icons.settings,
                      title: "Settings",
                    ),
                    const SettingItem(
                      icon: Icons.help,
                      title: "Help",
                      shapeType: ShapeType.bottom,
                    ),

                    /// section 5
                    /// logout
                    const HeightBox(8),
                    Tap(
                      onTap: (){
                        NormalDialog(description: "Are you sure you want to sign out?",).show();
                      },
                      child: const SettingItem(
                          icon: Icons.logout, title: "Sign out", shapeType: ShapeType.only),
                    ),
                    // app logo
                    const HeightBox(8),
                    Container(
                      height: 29,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "FirstNetCopy".text.bold.color(Colors.white).size(29).make(),
                          VerticalLine(
                            width: 1,
                            color: Colors.white,
                          ).pSymmetric(h: 10, v: 5),
                          "MCPTX 4.5".text.color(Colors.white).make(),
                        ],
                      ),
                    ).pOnly(top: 16, bottom: 24)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _UserInfo() {
    final isDnd = settingProvider.dndSetting.value.isUsed;
    return Container(
      color: Color(0xFF343434),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                )),
          ).pOnly(bottom: 5),
          Container(
            width: 48,
            height: 48,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: isDnd ? Colors.red : Colors.green),
            child: Icon(
              isDnd ? Icons.minimize : Icons.person_rounded,
              color: Colors.white,
            ),
          ).pOnly(bottom: 4),
          (isDnd ? "Do not disturb" : "Online")
              .text
              .size(14)
              .color(Colors.white)
              .make()
              .pOnly(bottom: 13),
          "Donald Jenson".text.size(20).color(Colors.white).bold.make().pOnly(bottom: 3),
          "0576110".text.size(15).color(Color(0xFF8f8f8f)).make().pOnly(bottom: 16),
        ],
      ),
    );
  }
}
