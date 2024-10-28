import 'package:copy_project/widget/ui_widget/CircleLine.dart';
import 'package:flutter/material.dart';

class PttButton extends StatelessWidget {
  const PttButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        CircleLine(
          radius: 140.0,
          child: Icon(
            Icons.call,
            size: 60,
          ),
        )
      ],
    );
  }
}