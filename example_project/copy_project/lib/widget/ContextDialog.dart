import 'package:copy_project/widget/TabWidget.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data/message/Message.dart';

class ContextDialog extends DialogWidget {
  final bool isUsedTitle;
  final List<ContextMenuType> menuList;
  final Message? message;
  final void Function(ContextMenuType, Message?)? onItemSelected;

  ContextDialog({
    super.key,
    this.isUsedTitle = false,
    required this.menuList,
    this.message,
    this.onItemSelected,
  });

  @override
  DialogState<ContextDialog> createState() => _ContextDialogState();
}

class _ContextDialogState extends DialogState<ContextDialog> {
  @override
  Widget build(BuildContext context) {
    if (widget.message != null) {
      print("message : ${widget.message!.message}");
    }
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              radius10,
            ),
            color: Color(0xFF343434),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.menuList
                .map(
                  (item) => Tap(
                    onTap: () {
                      if (widget.onItemSelected != null) {
                        widget.onItemSelected!(item, widget.message);
                      }
                      Nav.pop(context);
                    },
                    child: item.title.text.color(Colors.white).size(17).make().p(20),
                  ),
                )
                .toList(),
          ),
        ).pSymmetric(h: 38),
      ),
    );
  }
}

enum ContextMenuType {
  clearAlert("Clear Emergency Alert");

  const ContextMenuType(this.title);

  final String title;
}
