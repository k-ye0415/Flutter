import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double radiusValue;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const RoundedContainer({
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.radiusValue = 10,
    this.borderRadiusGeometry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadiusGeometry ?? BorderRadius.circular(radiusValue),
        color: color,
      ),
      child: child,
    );
  }
}
