import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/item/SettingItem.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: context.appColors.defaultBackground,
        child: Column(
          children: [
            // user info
            Container(
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
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                    child: Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                    ),
                  ).pOnly(bottom: 4),
                  "Online".text.size(14).color(Colors.white).make().pOnly(bottom: 13),
                  "Donald Jenson".text.size(20).color(Colors.white).bold.make().pOnly(bottom: 3),
                  "0576110".text.size(15).color(Color(0xFF8f8f8f)).make().pOnly(bottom: 16),
                ],
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// section 1
                    /// new gorup
                    /// first-to-answer
                    /// dnd
                    HeightBox(8),
                    SettingItem(
                      icon: Icons.add,
                      title: "Create a new group",
                      isUsedSwitch: false,
                      shapeType: ShapeType.top,
                    ),
                    SettingItem(
                      icon: Icons.call,
                      title: "Initiate a First-to-Answer call",
                      isUsedSwitch: true,
                    ),
                    SettingItem(
                      icon: Icons.do_not_disturb_on_rounded,
                      title: "Do not disturb",
                      isUsedSwitch: true,
                      shapeType: ShapeType.bottom,
                    ),

                    /// section 2
                    /// scan list
                    /// zone group
                    HeightBox(8),
                    SettingItem(
                      icon: Icons.list,
                      title: "Scan list",
                      isUsedSwitch: true,
                      shapeType: ShapeType.top,
                    ),
                    SettingItem(
                      icon: Icons.group,
                      title: "Zone groups",
                      isUsedSwitch: true,
                      shapeType: ShapeType.bottom,
                    ),

                    /// section 3
                    /// covert mode
                    /// focus mode
                    HeightBox(8),
                    SettingItem(
                      icon: Icons.remove_red_eye,
                      title: "Covert mode",
                      description: "Mute tones, sounds, vibrations, and notification alerts.",
                      isUsedSwitch: false,
                      shapeType: ShapeType.top,
                      isCovertMode: true,
                    ),
                    SettingItem(
                      icon: Icons.center_focus_strong,
                      title: "Focus mode",
                      description: "De-affiliate all groups except for the emergency group and hardware key mapped group.",
                      isUsedSwitch: true,
                      shapeType: ShapeType.bottom,
                    ),

                    /// section 4
                    /// battery
                    /// setting
                    /// help
                    HeightBox(8),
                    SettingItem(
                        icon: Icons.battery_2_bar_sharp,
                        title: "Low battery reporting frequency",
                        description: "Adjust your location reporting frequency.",
                        isUsedSwitch: false,
                        shapeType: ShapeType.top),
                    SettingItem(
                      icon: Icons.settings,
                      title: "Settings",
                      isUsedSwitch: false,
                    ),
                    SettingItem(
                      icon: Icons.help,
                      title: "Help",
                      isUsedSwitch: false,
                      shapeType: ShapeType.bottom,
                    ),

                    /// section 5
                    /// logout
                    HeightBox(8),
                    SettingItem(
                        icon: Icons.logout,
                        title: "Sign out",
                        isUsedSwitch: false,
                        shapeType: ShapeType.only),
                    // app logo
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
