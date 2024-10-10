import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/// 해당 위젯에 값이 변화된다해도, 외부에 의해 변화되는 것을 굳이 stateful 로 할 필요는 없음.
class PointButton extends StatelessWidget {
  final int point;

  const PointButton({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "내 포인트".text.color(context.appColors.lessImportant).make(),
        emptyExpanded,
        "${point}원".text.bold.make(),
        width10,
        Arrow(
          color: context.appColors.lessImportant,
        )
      ],
    );
  }
}
