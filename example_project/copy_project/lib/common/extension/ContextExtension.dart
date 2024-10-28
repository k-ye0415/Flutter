import 'package:copy_project/common/theme/AbstractThemeColors.dart';
import 'package:copy_project/common/theme/CustomThemeHolder.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  AbstractThemeColors get appColors => CustomThemeHolder.of(this).appColors;
}