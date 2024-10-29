import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isUsedSwitch;
  final ShapeType shapeType;
  final bool isCovertMode;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    this.description = "",
    required this.isUsedSwitch,
    this.shapeType = ShapeType.middle,
    this.isCovertMode = false,
  });

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    final needRadius = widget.shapeType == ShapeType.top || widget.shapeType == ShapeType.only;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF202020),
        borderRadius: BorderRadius.only(
          topLeft: needRadius ? Radius.circular(10) : Radius.circular(0),
          topRight: needRadius ? Radius.circular(10) : Radius.circular(0),
          bottomLeft: needRadius ? Radius.circular(10) : Radius.circular(0),
          bottomRight: needRadius ? Radius.circular(10) : Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16, left: 20, bottom: 16, right: 20),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  size: 24,
                  color: Color(0xFF8E8E8E),
                ).pOnly(right: 12),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.title.text.size(18).color(Colors.white).make(),
                                widget.description.isNotEmpty
                                    ? widget.description.text.color(Color(0xFF8f8f8f)).make()
                                    : goneWidget
                              ],
                            ),
                          ),
                          widget.isUsedSwitch
                              ? SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Switch(value: false, onChanged: (value) {}),
                                  ),
                                )
                              : widget.isCovertMode
                                  ? Icon(
                                      Icons.contrast,
                                      color: Colors.white,
                                    )
                                  : goneWidget
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          widget.shapeType == ShapeType.bottom
              ? goneWidget
              : widget.shapeType == ShapeType.only
                  ? goneWidget
                  : HorizontalLine(
                      color: Color(0xFF444444),
                    ).pOnly(left: 24 + 20 + 12, right: 20)
        ],
      ),
    );
  }
}

enum ShapeType {
  only(),
  top(),
  middle(),
  bottom();

  const ShapeType();
}
