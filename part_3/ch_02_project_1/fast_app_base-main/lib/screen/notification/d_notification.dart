import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/nav.dart';

/// Dialog 의 기본
class NotificationDialog extends DialogWidget {
  final List<TtossNotification> notification;

  NotificationDialog(this.notification, {super.key, super.animation = NavAni.Bottom, /*super.barrierDismissible = false*/});
  /// dialog 기본 기능에 대해 커스텀하려고 하면 super. 으로 진입 해 확인 및 설정 가능.

  @override
  DialogState<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...widget.notification
              .map((e) => NotificationItemWidget(onTap: (){
                widget.hide();
                /// 읭? 했던 'widget' 은 해당 클래스를 지칭하는것임.
          }, notification: e))
              .toList()
        ],
      ),
    );
  }
}
