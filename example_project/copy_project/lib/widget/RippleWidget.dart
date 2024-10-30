import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final bool enabled;

  const Ripple({
    super.key,
    required this.onTap,
    required this.child,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: context.appColors.defaultRipple,
        child: child,
      ),
    );
  }
}
