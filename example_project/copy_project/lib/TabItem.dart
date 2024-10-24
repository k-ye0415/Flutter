import 'package:copy_project/ContactFragment.dart';
import 'package:copy_project/GroupFragment.dart';
import 'package:copy_project/LocationFragment.dart';
import 'package:copy_project/RecentFragment.dart';
import 'package:flutter/material.dart';

enum TabItem {
  group(Icons.group, 'Group', GroupFragment()),
  contact(Icons.person_rounded, 'Contact', ContactFragment()),
  nearMe(Icons.history, 'Recent', RecentFragment()),
  location(Icons.location_on, 'Location', LocationFragment());

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage, {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          // color:
          // isActivated ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: tabName);
  }
}
