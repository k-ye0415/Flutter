import 'package:copy_project/data/settings/SettingProvider.dart';
import 'package:copy_project/data/settings/Settings.dart';
import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
import 'package:copy_project/widget/ui_widget/HorizontalLine.dart';
import 'package:copy_project/widget/ui_widget/VerticalLine.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Setting? usedSwitchAndValue;
  final ShapeType shapeType;
  final bool isCovertMode;
  final ValueChanged<bool>? onSwitchChanged;
  final bool isEnable;

  const SettingItem(
      {super.key,
      required this.icon,
      required this.title,
      this.description = "",
      this.usedSwitchAndValue = null,
      this.shapeType = ShapeType.middle,
      this.isCovertMode = false,
      this.onSwitchChanged,
      this.isEnable = true});

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> with SettingProvider {
  @override
  void initState() {
    Get.put(SettingsData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isTop = widget.shapeType == ShapeType.top;
    final isBottom = widget.shapeType == ShapeType.bottom;
    final isOnly = widget.shapeType == ShapeType.only;
    if (widget.isCovertMode) debugPrint("title : ${widget.title}");
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF202020),
        borderRadius: isOnly
            ? BorderRadius.all(Radius.circular(10))
            : BorderRadius.only(
                topLeft: Radius.circular(isTop ? 10 : 0),
                topRight: Radius.circular(isTop ? 10 : 0),
                bottomLeft: Radius.circular(isBottom ? 10 : 0),
                bottomRight: Radius.circular(isBottom ? 10 : 0),
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
                                widget.title.text
                                    .size(18)
                                    .color(widget.isEnable ? Colors.white : Color(0xFF8f8f8f))
                                    .make(),
                                widget.description.isNotEmpty
                                    ? widget.description.text.color(Color(0xFF8f8f8f)).make()
                                    : goneWidget
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              widget.isCovertMode
                                  ? IconButton(
                                      onPressed: () {}, // 화면 이동
                                      icon: Icon(
                                        Icons.contrast,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    )
                                  : goneWidget,
                              widget.usedSwitchAndValue != null
                                  ? CupertinoSwitch(
                                      trackColor: Colors.grey[200],
                                      value: widget.usedSwitchAndValue!.isUsed,
                                      onChanged: widget.isEnable
                                          ? (value) {
                                              setState(() {
                                                // settingProvider.dndSetting.value = Setting(widget.usedSwitchAndValue!.type, value);
                                                if (widget.onSwitchChanged != null) {
                                                  widget.onSwitchChanged!(value);
                                                }
                                              });
                                            }
                                          : null)
                                  : goneWidget,
                            ],
                          )
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
