import 'package:flutter/material.dart';
import 'package:part_9_project_1/game/enum.dart';

class InputCard extends StatelessWidget {
  final VoidCallback? callback;
  final Widget child;

  const InputCard({
    this.callback,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: InputContents(child: child),
        onTap: () => callback?.call(),
      ),
    );
  }
}

class InputContents extends StatelessWidget {
  const InputContents({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey, width: 8)),
      child: child,
    );
  }
}
