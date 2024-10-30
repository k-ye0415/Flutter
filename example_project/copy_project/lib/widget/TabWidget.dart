import 'package:flutter/material.dart';

class Tap extends StatelessWidget {
  final void Function() onTap;
  final void Function()? onLongPress;
  final Widget child;
  final bool enabled;

  const Tap({
    Key? key,
    required this.onTap,
    required this.child,
    this.onLongPress,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: enabled ? onTap : null,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}
