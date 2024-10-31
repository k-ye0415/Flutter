import 'package:copy_project/widget/ui_widget/CircleLine.dart';
import 'package:flutter/material.dart';

class PttButton extends StatelessWidget {
  final bool isVideoMode;
  const PttButton({
    super.key,
    required this.isVideoMode,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 144,
          height: 144,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF202020),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF202020).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        CircleLine(
          borderSize: 4.0,
          radius: 134.0,
          foregroundColor: Color(0xFF202020),
          child: Icon(
            isVideoMode ? Icons.video_camera_back_rounded : Icons.call,
            color: Colors.blue,
            size: 60,
          ),
        )
      ],
    );
  }
}