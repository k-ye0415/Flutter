import 'package:copy_project/common/theme/CustomThemeHolder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'CustomTheme.dart';

class CustomThemeApp extends StatefulWidget {
  final Widget child;

  const CustomThemeApp({super.key, required this.child});

  @override
  State<CustomThemeApp> createState() => _CustomThemeAppState();
}

class _CustomThemeAppState extends State<CustomThemeApp> {
  @override
  Widget build(BuildContext context) {
    return CustomThemeHolder(child: widget.child, theme: systemTheme);
  }

  CustomTheme get systemTheme {
    switch (SchedulerBinding.instance.platformDispatcher.platformBrightness) {
      case Brightness.dark:
        return CustomTheme.dark;
      case Brightness.light:
        return CustomTheme.light;
    }
  }
}
