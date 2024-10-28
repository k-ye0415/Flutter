import 'package:copy_project/widget/TabWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final VoidCallback onTap;

  const RoundedButton({
    super.key,
    required this.text,
    this.bgColor = Colors.orange,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: text.text.bold.color(Colors.white).size(18).make(),
        ),
      ),
    );
  }
}
