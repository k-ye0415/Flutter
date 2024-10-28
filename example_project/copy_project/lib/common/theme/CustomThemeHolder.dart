import 'package:copy_project/common/theme/AbstractThemeColors.dart';
import 'package:copy_project/common/theme/CustomTheme.dart';
import 'package:flutter/material.dart';

class CustomThemeHolder extends InheritedWidget {
  final AbstractThemeColors appColors;
  final CustomTheme theme;

  CustomThemeHolder({required super.child, required this.theme}) : appColors = theme.appColors;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static CustomThemeHolder of(BuildContext context) {
    CustomThemeHolder inherited =
        (context.dependOnInheritedWidgetOfExactType<CustomThemeHolder>())!;
    return inherited;
  }
}
