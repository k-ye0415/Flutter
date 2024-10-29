import 'package:copy_project/common/common.dart';
import 'package:flutter/material.dart';

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color get pointColor => const Color(0xFFF16522);

  Color get editTextBorder => const Color(0xFF53585e);

  Color get defaultBackground => const Color(0xFF0b0b0b);

  Color get incomingBubble => const Color(0xFF454545);

  Color get outgoingBubble => const Color(0xFFe86e33);
}
