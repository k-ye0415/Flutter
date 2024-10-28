import 'package:copy_project/common/theme/AbstractThemeColors.dart';
import 'package:copy_project/common/theme/DarkAppColors.dart';
import 'package:copy_project/common/theme/LightAppColors.dart';
import 'package:flutter/material.dart';

enum CustomTheme {
  dark(DarkAppColors()),
  light(LightAppColors());

  const CustomTheme(this.appColors);

  final AbstractThemeColors appColors;

  ThemeData get themeData {
    switch (this) {
      case CustomTheme.dark:
        return darkTheme;
      case CustomTheme.light:
        return lightTheme;
    }
  }
}

ThemeData lightTheme = ThemeData(
  useMaterial3: true, visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  // scaffoldBackgroundColor: AppColors.veryDarkGrey,
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true, visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  // scaffoldBackgroundColor: AppColors.veryDarkGrey,
);
